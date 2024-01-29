In the preceding lesson, we explored the reasons for favoring external libraries like Formik and Yup for form management over native approaches. In this lesson, we will proceed to build the checkout page within the SmileCart application, leveraging Formik form.

The checkout page is designed to gather user contact details and shipping address. Moreover, it will showcase the total bill amount, allowing users to place their order conveniently by clicking the **_Confirm order_** button.

<image>smile-cart-checkout-page.png</image>

Let's simplify the implementation by breaking down the requirement, for this lesson, into smaller segments:
- Develop a `Checkout` component responsible for displaying both the form and items.
- Develop a `Form` component to collect user contact information and shipping address.
- Establish necessary API functionalities to facilitate country and state selection.

We will start by creating the `Checkout` component. This component will present a checkout interface consisting of two sections:
- The left side of the interface will include a navigation control with a "back" button and a heading indicating the checkout process. This area primarily accommodates the form, which we will outline later in this lesson.
- The right side of the interface will display items added to the cart. The details for implementing this feature will be addressed in one of the upcoming lessons.

Let's create an `index.jsx` file within the `src/components/Checkout` folder.

```bash
mkdir src/components/Checkout
touch src/components/Checkout/index.jsx
```

We can mention the `Route` for the `Checkout` component in `App.jsx`:

```jsx
<Route exact component={Checkout} path={routes.checkout} />
```

In the `index.jsx` file, define the `Checkout` component as follows:

```jsx
import i18n from "i18next";
import { LeftArrow } from "neetoicons";
import { Typography } from "neetoui";
import { useTranslation } from "react-i18next";
import { useHistory } from "react-router-dom";
import withTitle from "utils/withTitle";

const Checkout = () => {
  const { t } = useTranslation();

  const history = useHistory();

  const handleRedirect = () => {
    history.goBack();
  };

  return (
    <div className="flex space-x-4">
      <div className="m-10 w-1/2">
        <div className="flex items-center">
          <LeftArrow
            className="hover:neeto-ui-bg-gray-400 neeto-ui-rounded-full mr-4"
            onClick={handleRedirect}
          />
          <Typography
            className="text-left"
            component="u"
            style="h3"
            textTransform="uppercase"
            weight="bold"
          >
            {t("checkout")}
          </Typography>
        </div>
        <div className="mt-8 space-y-4">
          {/* Form will be displayed here */}
        </div>
      </div>
      <div className="neeto-ui-bg-gray-300 h-screen w-1/2 pt-10">
        {/* Items added to cart will be displayed here */}
      </div>
    </div>
  );
};

export default withTitle(Checkout, i18n.t("checkout"));
```

The `Checkout` component has been configured to house the form. Let's proceed to set up the form. As mentioned before, we will utilize Formik for form handling.

Before integrating Formik form into our application, let's see how Formik form should be generally structured. A standard setup for a Formik form comprises these key elements:

- **Formik Component Wrapper**: The `Formik` component encapsulates the entire form structure. This component acts as the form manager, handling form values, validation, submission, and other form-related functionalities.
- **Form Component**:  Nested within the `Formik` component, the `Form` component from Formik serves as a concise wrapper for the HTML `form` element. It seamlessly connects with Formik's `handleSubmit` and `handleReset` functionalities. It passes any other props directly to the HTML form node. In essence, using `<Form />` is the same as manually coding `<form onReset={formikProps.handleReset} onSubmit={formikProps.handleSubmit} {...props} />`.
- **Form Fields**: Within the `Form` component, we add form fields using the `Field` component provided by Formik. `Field` connects inputs to Formik, utilizing the `name` attribute to synchronize with Formik state. By default, `Field` corresponds to an HTML `input` element. We can further customize `Field` functionality by passing a callback function as children to the `Field` component.
- **Submit Button**: We include a submit button within the `Form` component. This button triggers the form submission logic which is generally defined within the `handleSubmit` function. This function will be passed to the `onSubmit` prop of the `Formik` component.

Here is a basic example:

```jsx
import { Formik, Form, Field } from 'formik';

const MyForm = () => {
  const handleSubmit = (values, actions) => {
    // Handle form submission logic here
  };

  return (
    <Formik
      initialValues={{ firstName: '' }}
      onSubmit={handleSubmit}
      validationSchema={{ /* validation schema, if any */ }}
    >
      <Form>
        <Field name="firstName">
        {({ field, form, meta }) => (
          <div>
            <input type="text" {...field} />
            {meta.touched &&
              meta.error && <p className="error">{meta.error}</p>}
          </div>
        )}
        </Field>

        <button type="submit">Submit</button>
      </Form>
    </Formik>
  );
};
```

While Formik abstracts away majority of the boilerplate code, the neetoUI library help us further enhance the form-building experience by offering its [Form](https://neeto-ui.neeto.com/?path=/docs/formik-form--docs) component and several Formik input components.

The neetoUI `Form` simplifies Formik form by encapsulating the core `Formik` and `Form` components from the Formik library. Furthermore, the neetoUI library provides Formik input components like [Input](https://neeto-ui.neeto.com/?path=/docs/components-input--docs#formik-input) and [Select](https://neeto-ui.neeto.com/?path=/docs/components-select--docs#formik-select-with-validation), abstracting away the usage of `Field` and the callback function passed as its children.

When integrating these components into your project, pay special attention to the import paths, specifically in the context of Formik. Ensure that you use the correct import path, `/formik`, to access the Formik-specific components.

Utilizing these neetoUI Formik form elements, the structure becomes more straightforward, as illustrated below in the modified example:

```jsx
import { Form as NeetoUIForm } from "neetoui/formik";
import { Input } from "neetoui/formik";
import { Button } from "neetoui";

const MyForm = () => {
  const handleSubmit = (values, actions) => {
    // Handle form submission logic here
  };

  return (
    <NeetoUIForm
      formikProps={{
        initialValues: { firstName: '' },
        onSubmit: handleSubmit,
        validationSchema: { /* validation schema, if any */ },
      }}
    >
        <Input name="firstName" />
        <Button type="submit" label="Submit" />
    </NeetoUIForm>
  );
};
```

Now that we are familiarized with the Formik form elements from neetoUI, let's incorporate them into SmileCart.

In our application, we will encapsulate all the formik input components in a custom `Form` component. Let's create a file `Form.jsx` within the `Checkout` directory by executing the following from the root of the project:

```bash
touch src/components/Checkout/Form.jsx
```

We will first define the basic input fields including email, first name, last name, address, apartment, city and pincode.

```jsx
import { Typography } from "neetoui";
import { Input } from "neetoui/formik";
import { useTranslation } from "react-i18next";

const Form = () => {
  const { t } = useTranslation();

  return (
    <>
      <Typography style="h3" weight="semibold">
        {t("contact")}
      </Typography>
      <Input
        required
        label={t("email")}
        name="email"
        placeholder={t("enterYourEmail")}
        size="large"
      />
      <Typography className="pt-5" style="h3" weight="semibold">
        {t("shippingAddress")}
      </Typography>
      <div className="flex space-x-2">
        <Input
          required
          label={t("firstName")}
          name="firstName"
          placeholder={t("enterFirstName")}
          size="large"
        />
        <Input
          required
          label={t("lastName")}
          name="lastName"
          placeholder={t("enterLastName")}
          size="large"
        />
      </div>
      <Input
        required
        label={t("address")}
        name="address"
        placeholder={t("enterAddress")}
        size="large"
      />
      <Input
        required
        label={t("apartment")}
        name="apartment"
        placeholder={t("enterApartmentNumber")}
        size="large"
      />
      <div className="flex space-x-2">
        <Input
          required
          label={t("city")}
          name="city"
          placeholder={t("enterCity")}
          size="large"
        />
        <Input
          required
          label={t("zipCode")}
          name="zipCode"
          placeholder={t("enterZipCode")}
          size="large"
          type="number"
        />
      </div>
    </>
  );
};

export default Form;
```

We also need to add the ability to select country and state to our form. To achieve this, we'll make API requests to `/countries` and `/states` to list countries and states respectively. Let's create two API connector files `countries.js` and `states.js` within `src/apis`.

```bash
touch src/apis/countries.js
touch src/apis/states.js
```

Within `countries.js`, let's define a `fetch` method that makes a GET request to `/countries` to list all countries.

```jsx
import axios from "axios";

const fetch = () => axios.get("countries");

const countriesApi = { fetch };

export default countriesApi;
```

Similarly, let's create a `fetch` method in `states.js`. This function will send a GET request to `/states`, with the selected country code as `params`. This request will fetch a list of all states within that country.

```jsx
import axios from "axios";

const fetch = params => axios.get("states", { params });

const statesApi = { fetch };

export default statesApi;
```

We will use react query to handle the fetching and management of data. Let's create a `useCheckoutApi.js` file within `src/hooks/reactQuery`.

```bash
touch src/hooks/reactQuery/useCheckoutApi.js
```

Within the `useCheckoutApi.js`, we will define two hooks:
- `useFetchCountries`: This hook manages the retrieval of the list of countries.
- `useFetchStates`: This hook manages the retrieval of the list of states in the selected country.

```js
import { QUERY_KEYS } from "constants/query";

import countriesApi from "apis/countries";
import statesApi from "apis/states";
import { prop } from "ramda";
import { useQuery } from "react-query";

export const useFetchCountries = () =>
  useQuery({
    queryKey: QUERY_KEYS.COUNTRIES,
    queryFn: () => countriesApi.fetch(),
    select: prop("countries"),
    staleTime: Infinity,
  });

export const useFetchStates = stateParams =>
  useQuery({
    queryKey: [QUERY_KEYS.STATES, stateParams],
    queryFn: () => statesApi.fetch(stateParams),
    select: prop("states"),
    staleTime: Infinity,
  });
```

Let's also update the `src/constants/query.js` file with the new keys.

```jsx{3-5}
export const QUERY_KEYS = {
  PRODUCTS: "products",
  CHECKOUT: "checkout",
  COUNTRIES: "countries",
  STATES: "states",
};
```

Now, we can utilize these hooks within the `Form` component for selecting country and state.

The `useFetchCountries` and `useFetchStates` hooks will fetch the list of countries and states. The data will then be destructured into `countries` and `states` respectively.

When a country is selected, we want to reset the state selection to `null`. This ensures that state selection follows country selection exclusively. Formik's default `onChange` behavior only handles the country field and doesn't affect the state field. To address this, we'll create a `handleChangeCountry` function. This function utilizes `setFieldValue` from the `useFormikContext` hook to modify both the country and state fields. The `useFormikContext` is a custom React hook that will return all Formik state and helpers via React Context.

The revamped JSX code will include two `Select` components, one designated for country selection and the other for state selection. The `optionRemapping` prop in the `Select` component allows you to map specific keys to the label and value properties of the `options` prop.

```jsx {2-8, 13-21, 23-26, 34-44, 54-62}
// ...
import { useFormikContext } from "formik";
import {
  useFetchStates,
  useFetchCountries,
} from "hooks/reactQuery/useCheckoutApi";
// ...
import { Input, Select } from "neetoui/formik";
// ...

const Form = () => {
  // ...
  const {
    setFieldValue,
    values: { country },
  } = useFormikContext();

  const { data: countries = [] } = useFetchCountries();
  const { data: states = [] } = useFetchStates({
    countryCode: country.code,
  });

  const handleChangeCountry = country => {
    setFieldValue("country", country);
    setFieldValue("state", null);
  };

  return (
    <>
      // ...
      <Typography className="pt-5" style="h3" weight="semibold">
        {t("shippingAddress")}
      </Typography>
      <Select
        required
        label={t("country")}
        name="country"
        optionRemapping={{ label: "name", value: "code" }}
        options={countries}
        placeholder={t("selectCountry")}
        size="large"
        value={country}
        onChange={handleChangeCountry}
      />
      // ...
      <div className="flex space-x-2">
        <Input
          required
          label={t("city")}
          name="city"
          placeholder={t("enterCity")}
          size="large"
        />
        <Select
          required
          label={t("state")}
          name="state"
          optionRemapping={{ label: "name", value: "code" }}
          options={states}
          placeholder={t("selectState")}
          size="large"
        />
        // ...
      </div>
    </>
  );
};

export default Form;
```

Having completed the full definition of the `Form` component, the next step is to integrate it into the `Checkout` component.

Before proceeding, we should set up the initial form values to be supplied to neetoUI's `Form` component via `formikProps`. To do this, let's create a `constants.js` file in the `Checkout` directory.

```bash
touch src/components/Checkout/constants.js
```

Now let's define the `CHECKOUT_FORM_INITIAL_VALUES` in the `constants.js` file.

```js
export const CHECKOUT_FORM_INITIAL_VALUES = {
  email: "",
  country: { code: "US", name: "United States" },
  firstName: "",
  lastName: "",
  address: "",
  apartment: "",
  city: "",
  state: null,
  zipCode: "",
};
```

Within the `Checkout` component, we're set to enclose the initially returned JSX using neetoUI's `Form` component, imported as `NeetoUIForm`. We'll provide the `CHECKOUT_FORM_INITIAL_VALUES` object containing the initial values to the `formikProps` prop. Additionally, we will also pass `noValidate: true` into `formProps` to disable the default HTML form validation that the browser applies before submitting the form.

We'll also retrieve the `isLoading` value from the `useFetchCountries` hook and conditionally render the `PageLoader` based on its value.

```jsx {2-10, 16, 22, 25-30, 35, 40}
// ...
import { PageLoader } from "components/commons";
import { useFetchCountries } from "hooks/reactQuery/useCheckoutApi";

import { Form as NeetoUIForm } from "neetoui/formik";

import {
  CHECKOUT_FORM_INITIAL_VALUES
} from "./constants";
import Form from "./Form";

const Checkout = () => {
  // ...
  const history = useHistory();

  const { isLoading } = useFetchCountries();

  const handleRedirect = () => {
    history.goBack();
  };

  if (isLoading) return <PageLoader />;

  return (
    <NeetoUIForm
      formProps={{ noValidate: true }}
      formikProps={{
        initialValues: CHECKOUT_FORM_INITIAL_VALUES,
      }}
    >
      <div className="flex space-x-4">
        <div className="m-10 w-1/2">
          // ...
          <div className="mt-8 space-y-4">
            <Form />
          </div>
        </div>
        // ...
      </div>
    </NeetoUIForm>
  );
};

export default withTitle(Checkout, i18n.t("checkout"));
```

Lastly, we will add all the required translation keys to `en.json` file.

```json
{
  // ..
  "checkout": "Checkout",
  "contact": "Contact",
  "email": "Email",
  "enterYourEmail": "Enter your email",
  "shippingAddress": "Shipping address",
  "country": "Country",
  "selectCountry": "Select the country",
  "firstName": "First name",
  "enterFirstName": "Enter first name",
  "lastName": "Last name",
  "enterLastName": "Enter last name",
  "address": "Address",
  "enterAddress": "Enter address",
  "apartment": "Apartment",
  "enterApartmentNumber": "Enter apartment number",
  "city": "City",
  "enterCity": "Enter city name",
  "state": "State",
  "selectState": "Select the state",
  "zipCode": "Zip code",
  "enterZipCode": "Enter zip code"
}
```

With that, we have successfully integrated Formik form into our application. We defined all the Formik inputs within the `Form` component and rendered this in the `Checkout` component. In the next lesson, we will implement Yup validations for this form.

Let's commit the new changes:

```bash
git add -A
git commit -m "Integrated Formik form into the checkout page"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/d6cc09d8a160bc4fe24525fb28aa159782f330f5).
