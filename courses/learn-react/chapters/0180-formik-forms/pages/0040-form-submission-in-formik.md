
With the form fields and validations in place, we're ready to manage form submission. In this lesson, we will delve into Formik's approach to handling submissions and explore how we can utilize this to place an order.

## Submission handling in Formik

Handling form submission in Formik involves multiple stages, from pre-submit actions to validation and actual submission handling. Let's break it down:

### Pre-Submit Phase
Before initiating the submission process, Formik undertakes several preparatory steps:

1. Touching Fields: All fields within the form are "touched" to ensure they've been interacted with, utilizing the provided `initialValues` as a baseline for comparison.

2. Setting `isSubmitting` to `true`: This flag indicates that the form is in the process of being submitted.

3. Incrementing `submitCount`: Keeping track of the number of times the form has been submitted.

### Validation Stage
The validation stage primarily involves the following steps:

1. Setting `isValidating` to `true`: Signaling that the validation process is underway.

2. Running Validations: This involves executing field-level validations defined by the `validationSchema`. These validations occur asynchronously and their results are deeply merged.

3. Error Check: Upon validation completion, Formik checks if there are any errors:

    - Errors Found: If errors exist, the submission is aborted. `isValidating` is set to `false`, `errors` object is set, and `isSubmitting` is set to `false` to halt the submission.
    - No Errors: If the validation passes without errors, the process moves to the submission phase.

### Submission Phase
The final step involves handling the submission of the form:

1. Executing the Submission Handler: The form invokes the designated submission handler, handler passed to `onSubmit` prop, to process the form values. This action takes place within this phase. The `onSubmit` callback function receives two parameters:
    -  `values`: This parameter contains the current values of all the form fields at the time of submission. It represents the data that the user has entered into the form.
    - `formikBag`: The `formikBag` is an object provided by Formik, and it includes a subset of injected props and methods. Specifically, it contains all the methods with names that start with `set<Thing>` and `resetForm`, as well as any props that were passed to the wrapped component.

2. Checking for a Promise:
    - Handling Promise: If the submit handler returns a promise, Formik awaits resolution or rejection of the promise returned by the submission handler. Upon completion, `setSubmitting` is set to `false` to finalize the submission cycle.
    - Handling Synchronous Submission: In cases where the submission handler is synchronous, it's crucial to manually call `setSubmitting(false)` to conclude the submission cycle. **Formik won't automatically handle this for synchronous submissions.**

## Managing form submission and order creation in SmileCart

In SmileCart, handling form submission involves creating an order with the entered form values. This operation is facilitated by sending a POST request to `/orders`, using the form data as the payload. To initiate this functionality, we'll set up an API connector file named `orders.js` within the `src/apis` directory.

```bash
touch src/apis/orders.js
```

Within this file let's define the `create` method to execute the POST request.

```js
import axios from "axios";

const create = payload => axios.post("orders", payload);

const ordersApi = { create };

export default ordersApi;
```

Up until this point, our interactions revolved mainly around GET requests, primarily focused on fetching data. Employing React Query, we utilized the `useQuery` hook to efficiently manage these operations. However, creating an order involves a POST request that modifies the database. To facilitate this, React Query provides `useMutation`, a hook tailored specifically for handling mutation actions like creating, updating, or deleting server data.

The `useMutation` hook operates by accepting a mutation function as its parameter, encapsulating the necessary logic for altering data on the server side.

Given our scenario of creating an order based on form inputs, we will pass in the `ordersApi.create` method into the `useMutation` hook. Let's include the following lines within the file `src/hooks/reactQuery/useCheckoutApis.js`.

```jsx
// ...
import ordersApi from "apis/orders";
import { useQuery, useMutation } from "react-query";

export const useCreateOrder = () => useMutation(ordersApi.create);
// ...
```

Next, we'll incorporate the submit button and its corresponding event handler into the `Checkout` component. The submit button will include a `type` prop set to `submit`, ensuring it triggers the necessary action when clicked. The submission logic is designed to generate an order using the `mutate` function, which has been aliased as `createOrder`, from the earlier established `useCreateOrder` hook.

Additionally, we'll introduce a state named `isSubmitDisabled`, which evaluates to `true` when the form is in the process of being submitted. This state assists in disabling the submit button during the submission process.

```jsx {1, 5, 11-25, 35, 44-49}
import { useRef, useState } from "react";
// ...
import {
  useFetchCountries,
  useCreateOrder,
} from "hooks/reactQuery/useCheckoutApi";
import { Typography, Checkbox, Button } from "neetoui";
// ...

const Checkout = () => {
  const [isSubmitDisabled, setIsSubmitDisabled] = useState(false);
  // ...
  const { mutate: createOrder } = useCreateOrder();
  //...

  const handleSubmit = values => {
    setIsSubmitDisabled(true);

    createOrder(
      { payload: values },
      {
        onError: () => setIsSubmitDisabled(false),
      }
    );
  };

  // ...

  return (
    <NeetoUIForm
      formProps={{ noValidate: true }}
      formikProps={{
        initialValues: CHECKOUT_FORM_INITIAL_VALUES,
        validationSchema: CHECKOUT_FORM_VALIDATION_SCHEMA,
        onSubmit: handleSubmit,
      }}
    >
      <div className="flex space-x-4">
        // ...
        <div className="neeto-ui-bg-gray-300 h-screen w-1/2 pt-10">
          {/* Items added to cart will be displayed here */}
          <div className="mt-auto flex justify-center">
            <Button
              className="bg-neutral-800 w-1/3 justify-center"
              disabled={isSubmitDisabled}
              label={t("confirmOrder")}
              type="submit"
            />
          </div>
        </div>
      </div>
    </NeetoUIForm>
  );
};

export default withTitle(Checkout, i18n.t("checkout"));
```

Furthermore, we will introduce a `redirectToHome` function designed to redirect the user to the product listing page and clear the cart 1500 milliseconds after a successful submission. We will also enhance the `handleRedirect` logic to clear the cart and cancel the timeout in case the back button is pressed shortly after submission, but prior to redirection to the product listing page.

First, let's add a function to the cart items store to clear the cart.

```js {7}
// ...

const useCartItemsStore = create(
  persist(
    set => ({
      // ...
      clearCart: () => set({ cartItems: {} }),
    }),
    { name: "cart-items-store" }
  )
);
```

Now, update the `Checkout` component as follows:

```jsx {6, 8, 12-17, 20-26, 35-37}
import routes from "routes";
import useCartItemsStore from "stores/useCartItemsStore";
// ...
const Checkout = () => {
  // ...
  const timerRef = useRef(null);
  // ...
  const clearCart = useCartItemsStore.pickFrom();
  // ...
  const { mutate: createOrder } = useCreateOrder();
  //...
  const redirectToHome = () => {
    timerRef.current = setTimeout(() => {
      history.push(routes.root);
      clearCart();
    }, 1500);
  };

  const handleRedirect = () => {
    if (timerRef.current) {
      history.push(routes.root);
      clearCart();
      clearTimeout(timerRef.current);
    } else {
      history.goBack();
    }
  };

  const handleSubmit = values => {
    setIsSubmitDisabled(true);

    createOrder(
      { payload: values },
      {
        onSuccess: () => {
          redirectToHome();
        },
        onError: () => setIsSubmitDisabled(false),
      }
    );
  };

  // ...
};

export default withTitle(Checkout, i18n.t("checkout"));
```

We've implemented the submission logic to manage actions when users click the submit button. However, merely executing the submission isn't enough. How do we ensure users know that their order went through successfully? To achieve this, we will integrate `Toastr` from neetoUI, which presents Toast messages in small popups to give users visual cues about their actions.

Here's how the workflow for displaying these Toast messages will function:

- Upon successful placement of an order, the backend will send a translation key labeled as `notice_code` within the `response.data object`.
- After converting the keys to camelCase, within the response interceptor, `Toastr.success` will automatically extract this notice code from the provided object and display it as a popup message. To make this work seamlessly, we'll need a translation key in `en.json` that matches the one sent from the backend.
- In the event of an error, `Toastr.error` will handle displaying the error as a toast message to alert the user.

Let's incorporate this logic within the response interceptor located in the `axios.js` file.

```js
// ..
import { t } from "i18next";
import { Toastr } from "neetoui";
// ..

const shouldShowToastr = response =>
  typeof response === "object" && response?.noticeCode;

const showSuccessToastr = response => {
  if (shouldShowToastr(response.data)) Toastr.success(response.data);
};

const showErrorToastr = error => {
  if (error.message === t("error.networkError")) {
    Toastr.error(t("error.noInternetConnection"));
  } else if (error.response?.status !== 404) {
    Toastr.error(error);
  }
};

const transformResponseKeysToCamelCase = response => {
  if (response.data) response.data = keysToCamelCase(response.data);
};

const responseInterceptors = () => {
  axios.interceptors.response.use(
    response => {
      transformResponseKeysToCamelCase(response);
      showSuccessToastr(response);

      return response.data;
    },
    error => {
      showErrorToastr(error);

      return Promise.reject(error);
    }
  );
};

// ..
```

Finally, we'll include all the necessary translation keys in the `en.json` file.

```json
{
  // ..
  "confirmOrder": "Confirm order",
  // ..
  "error": {
    // ..
    "noInternetConnection": "No Internet Connection",
    "networkError": "Network Error"
  },
  // ..
  "order": {
    "successfullyPlaced": "Order has been successfully placed"
  }
}
```

Form handling with Formik comes to a close here. In the next lesson, we'll add a section within the `Checkout` component to showcase cart items and their total price.

Let's commit the new changes:

```bash
git add -A
git commit -m "Added submission handler to forms"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/07da2959de10173807669039c82cf0cf8b1140bf).
