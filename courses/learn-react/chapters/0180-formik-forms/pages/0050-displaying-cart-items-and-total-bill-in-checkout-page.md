In the previous lesson we handled submission in formik form. In this lesson, our primary focus will be on presenting cart items within the checkout page.

Here's a breakdown of what we aim to achieve:

- Incorporate a dedicated section within the checkout page to exhibit products added to the cart, accompanied by their total price and any applicable discounts.
- Implement the functionality to persist user information provided through form in local storage.

Our initial step involves showcasing the details of each product. To accomplish this, we'll create a `Product.jsx` file within the `Checkout` directory.

```bash
touch src/components/Checkout/Product.jsx
```

The `Product.jsx` file will house the `Product` component responsible for displaying product images, names, and prices in card format within the checkout items section. This component will access the product quantity from `useCartItemsStore` based on the product's slug, renaming it as `selectedQuantity`. The quantity will be displayed as a tag at the top-right corner of the product image.

Let's add the following contents to the `Product.jsx`:

```jsx
import { Typography, Tag } from "neetoui";
import useCartItemsStore from "stores/useCartItemsStore";

const Product = ({ name, imageUrl, offerPrice, slug }) => {
  const { [slug]: selectedQuantity } = useCartItemsStore.pick("cartItems");

  return (
    <div className="mt-3 flex">
      <div className="neeto-ui-rounded neeto-ui-border-gray-500 relative border">
        <img
          alt={name}
          className="neeto-ui-rounded"
          height={60}
          src={imageUrl}
          width={60}
        />
        <div className="absolute right-0 top-0 -mr-2 -mt-2">
          <Tag className="w-2" label={selectedQuantity} type="solid" />
        </div>
      </div>
      <div className="m-5 flex w-1/2 justify-between">
        <Typography style="h5" weight="semibold">
          {name}
        </Typography>
        <Typography style="h5">${offerPrice}</Typography>
      </div>
    </div>
  );
};

export default Product;
```

Next, we aim to display the total price and any applicable discounts below the product details. For this purpose, we'll create a reusable component called `PriceEntry` to exhibit charges and their respective costs. To create the file for this component, run the following command:

```bash
touch src/components/Checkout/PriceEntry.jsx
```

The `PriceEntry.jsx` file will contain the presentation logic for the `PriceEntry` component:

```jsx
import { Typography } from "neetoui";
import { Trans } from "react-i18next";

const PriceEntry = ({ totalPrice, i18nKey, className = "" }) => (
  <Typography className="flex justify-between" style="h5">
    <Trans
      {...{ i18nKey }}
      components={{ span: <span {...{ className }} /> }}
      values={{ totalPrice }}
    />
  </Typography>
);

export default PriceEntry;
```

Now, let's consolidate all these components into a new component named `Items.jsx`. Begin by creating a `Items.jsx` file within the `Checkout` directory. Run the following command from the project root to generate this file:

```bash
touch src/components/Checkout/Items.jsx
```

Within the newly created file, we will define the `Items` component. This component will use `useCartItemsStore` to fetch the slugs of the cart items. These slugs will then be used to retrieve product details using the `useFetchCartProducts` hook. Additionally, the `cartTotalOf` function will be utilized to display the subtotal and total payable amount.

```jsx
import { OFFER_PRICE } from "components/constants";
import { cartTotalOf } from "components/utils";
import { useFetchCartProducts } from "hooks/reactQuery/useProductsApi";
import { Button } from "neetoui";
import { keys } from "ramda";
import { useTranslation } from "react-i18next";
import useCartItemsStore from "stores/useCartItemsStore";
import { shallow } from "zustand/shallow";

import PriceEntry from "./PriceEntry";
import Product from "./Product";

const Items = ({ isSubmitDisabled }) => {
  const { t } = useTranslation();

  const slugs = useCartItemsStore(store => keys(store.cartItems), shallow);

  const { data: products = [] } = useFetchCartProducts(slugs);

  const totalCheckoutPrice = cartTotalOf(products, OFFER_PRICE);

  return (
    <div className="flex h-full flex-col p-10">
      {products.map(product => (
        <Product key={product.slug} {...product} />
      ))}
      <div className="mt-5 w-3/4 space-y-3">
        <PriceEntry i18nKey="subtotal" totalPrice={totalCheckoutPrice} />
        <PriceEntry className="text-green-700" i18nKey="deliveryCharges" />
        <div className="neeto-ui-border-black border-t border-dashed" />
        <PriceEntry
          i18nKey="totalPayablePrice"
          totalPrice={totalCheckoutPrice}
        />
      </div>
    </div>
  );
};

export default Items;
```

To enhance the user experience, we will relocate the submit button from `index.jsx` to `Items.jsx`.

```jsx
// ...
import { Button } from "neetoui";
// ...

const Items = ({ isSubmitDisabled }) => {
  // ...

  return (
    <div className="flex h-full flex-col p-10">
      {products.map(product => (
        <Product key={product.slug} {...product} />
      ))}
      <div className="mt-5 w-3/4 space-y-3">
        // ...
      </div>
      <div className="mt-auto flex justify-center">
        <Button
          className="bg-neutral-800 w-1/3 justify-center"
          disabled={isSubmitDisabled}
          label={t("confirmOrder")}
          type="submit"
        />
      </div>
    </div>
  );
};

export default Items;
```

Next, we'll invoke the `Items` component inside the `Checkout` component, passing along the `isSubmitDisabled` prop.

```jsx {2, 24}
// ...
import Items from "./Items";

const Checkout = () => {
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
        <div className="m-10 w-1/2">
          // ...
          <div className="mt-8 space-y-4">
            <Form />
          </div>
        </div>
        <div className="neeto-ui-bg-gray-300 h-screen w-1/2 pt-10">
          <Items {...{ isSubmitDisabled }} />
        </div>
      </div>
    </NeetoUIForm>
  );
};

export default withTitle(Checkout, i18n.t("checkout"));
```

Let's also update the `isLoading` logic to accommodate the delay in fetching cart products. We will also add a logic to redirect the user to the home page if `cartItems` is empty.

```jsx {8-14, 19}
// ...
import { isEmpty, keys } from "ramda";
// ...
const Checkout = () => {
  // ...
  const { cartItems, clearCart } = useCartItemsStore.pick();

  const { isLoading: isLoadingProducts } = useFetchCartProducts(
    keys(cartItems)
  );
  const { isLoading: isLoadingCountries } = useFetchCountries();
  const { mutate: createOrder } = useCreateOrder();

  const isLoading = isLoadingProducts || isLoadingCountries;
  //...

  if (isLoading) return <PageLoader />;

  if (isEmpty(cartItems)) return history.push(routes.root);

  // ...
};

export default withTitle(Checkout, i18n.t("checkout"));
```

Now, we will introduce a functionality allowing users to optionally preserve their form information by storing it in local storage. First, we will define two utility functions in `src/utils/storage.js` to aid the implementation of our feature: `setToLocalStorage` and `getFromLocalStorage` .

Generate the `storage.js` file by executing the following command:
```bash
touch src/utils/storage.js
```

The `setToLocalStorage` function enables the storage of serialized data under a specific key in the local storage. If the provided value isn't `null`, it's transformed into a string using `JSON.stringify()` and stored in the designated key. If the value is `null`, the corresponding key is removed from local storage using `removeItem()`.

```js
export const setToLocalStorage = (key, value) => {
  if (value !== null) {
    localStorage.setItem(key, JSON.stringify(value));
  } else localStorage.removeItem(key);
};
```

The `getFromLocalStorage` function retrieves stored data from the local storage based on the provided key. It attempts to parse the stored value using `JSON.parse()`. If the parsing succeeds, it returns the parsed value; otherwise, it returns `null`. This function is enclosed in a try...catch block to handle parsing errors gracefully.

```js
// ...

export const getFromLocalStorage = key => {
  try {
    const value = localStorage.getItem(key);

    return value ? JSON.parse(value) : null;
  } catch {
    return null;
  }
};
```

We will also add a key to the `constants.js` file to facilitate storing and retrieving data.

```js
export const CHECKOUT_LOCAL_STORAGE_KEY = "checkoutUserDetails";
```

Now, let's add the feature to retain user information provided via form. This is achieved through the utilization of the `Checkbox` component, accessed via the `checkboxRef` reference.

During form submission, when the checkbox is marked, the form data is preserved by storing it in local storage, against the key `CHECKOUT_LOCAL_STORAGE_KEY`, using the `setToLocalStorage` function. Conversely, if the checkbox is left unchecked, no data is stored, and `dataToPersist` is set to `null`.

If there is previously stored data in local storage for the checkout form, the `getFromLocalStorage` function retrieves this data, holding it in the `checkoutFormData` variable. This retrieved data is then employed as the initial values for the checkout form. The purpose of `checkoutFormData` is to ensure that if a user has previously completed the checkout form and chosen to save that information, the form will load with their saved data upon revisiting the page.


```jsx {1, 3, 7, 14, 17, 22, 26, 29, 43, 53-56}
import { Typography, Checkbox } from "neetoui";
// ...
import { setToLocalStorage, getFromLocalStorage } from "utils/storage";
import {
  CHECKOUT_FORM_INITIAL_VALUES,
  CHECKOUT_FORM_VALIDATION_SCHEMA,
  CHECKOUT_LOCAL_STORAGE_KEY,
} from "./constants";

// ...
const Checkout = () => {
  // ...

  const checkboxRef = useRef(null);
  // ...

  const checkoutFormData = getFromLocalStorage(CHECKOUT_LOCAL_STORAGE_KEY);

  // ...

  const handleSubmit = values => {
    const dataToPersist = checkboxRef.current.checked ? values : null;
    setIsSubmitDisabled(true);

    createOrder(
      { payload: dataToPersist },
      {
        onSuccess: () => {
          setToLocalStorage(CHECKOUT_LOCAL_STORAGE_KEY, dataToPersist);
          redirectToHome();
        },
        onError: () => setIsSubmitDisabled(false),
      }
    );
  };

  // ...

  return (
    <NeetoUIForm
      formProps={{ noValidate: true }}
      formikProps={{
        initialValues: checkoutFormData || CHECKOUT_FORM_INITIAL_VALUES,
        validationSchema: CHECKOUT_FORM_VALIDATION_SCHEMA,
        onSubmit: handleSubmit,
      }}
    >
      <div className="flex space-x-4">
        <div className="m-10 w-1/2">
          // ...
          <div className="mt-8 space-y-4">
            <Form />
            <Checkbox
              defaultChecked
              label={t("saveInformationForNextTime")}
              ref={checkboxRef}
            />
          </div>
        </div>
        // ...
      </div>
    </NeetoUIForm>
  );
};

export default withTitle(Checkout, i18n.t("checkout"));
```

Finally, we'll include the `saveInformationForNextTime` translation key in the `en.json` file.

```json
{
  // ..
  "saveInformationForNextTime": "Save this information for next time",
}
```

That concludes the implementation of the checkout page. Let's commit the new changes:

```bash
git add -A
git commit -m "Added component to display cart items and total cost"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/7544a2cdf7ad98d349f3b23adf3315dfe8a6c596).
