In this lesson, we will add a feature to set the quantity of products added to the cart, as shown below:

<image>product-quantity-requirement.gif</image>

Let's get started by enabling the `useCartItemsStore` to store the quantity of a product along with its slug. We can transform the `cartItems` state into an object with the `slug` as the key and the `quantity` as the value. Initially, we'll set the value of `cartItems` as an empty object. We will replace the `toggleIsInCart` function with `setSelectedQuantity`, which will update the quantity of a product. If the quantity supplied is zero or negative, the function will remove that product from the cart.

```js
import { assoc, dissoc } from "ramda";
import { create } from "zustand";

const useCartItemsStore = create(set => ({
  cartItems: {},
  setSelectedQuantity: (slug, quantity) =>
    set(({ cartItems }) => {
      if (quantity <= 0) {
        return { cartItems: dissoc(slug, cartItems) };
      }

      return { cartItems: assoc(slug, quantity, cartItems) };
    }),
}));

export default useCartItemsStore;
```

Since we have made `cartItems` an object, we should take the length of keys of the object to get the cart items count in `Header` component:

```jsx {1, 5-7}
import { keys } from "ramda";
// remaining imports

const Header = ({/* props */}) => {
  const cartItemsCount = useCartItemsStore(
    store => keys(store.cartItems).length
  );

  // remaining code
}
```

Now, let's build a component to manage product quantity updates as shown:

<image>product-quantity.png</image>

Create a component named `ProductQuantity` in the commons directory for the same:

```bash
touch src/components/commons/ProductQuantity.jsx
```

We can retrieve the quantity associated with a specific product and the `setSelectedQuantity` function from the Zustand store to display and update the product quantity. We will make use of the [paths](https://ramdajs.com/docs/#paths) function from ramda to pick these keys from the cart items store.

```jsx
import { Button } from "neetoui";
import { paths } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";
import { shallow } from "zustand/shallow";

const ProductQuantity = ({ slug }) => {
  const [selectedQuantity, setSelectedQuantity] = useCartItemsStore(
    paths([["cartItems", slug], ["setSelectedQuantity"]]),
    shallow
  );

  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
      <Button
        className="focus-within:ring-0"
        label="-"
        style="text"
        onClick={() => setSelectedQuantity(slug, selectedQuantity - 1)}
      />
      {selectedQuantity}
      <Button
        className="focus-within:ring-0"
        label="+"
        style="text"
        onClick={() => setSelectedQuantity(slug, selectedQuantity + 1)}
      />
    </div>
  );
};

export default ProductQuantity;
```

Similar to the `AddToCart` component, we should prevent navigation to the product page when the user interacts with this component from the `ProductListItem` component:

```jsx {4-7, 15-18, 25-28}
const ProductQuantity = ({ slug }) => {
  // ...

  const preventNavigation = e => {
    e.stopPropagation();
    e.preventDefault();
  };

  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
      <Button
        className="focus-within:ring-0"
        label="-"
        style="text"
        onClick={e => {
          preventNavigation(e);
          setSelectedQuantity(slug, selectedQuantity - 1);
        }}
      />
      {selectedQuantity}
      <Button
        className="focus-within:ring-0"
        label="+"
        style="text"
        onClick={e => {
          preventNavigation(e);
          setSelectedQuantity(slug, selectedQuantity + 1);
        }}
      />
    </div>
  );
};

export default ProductQuantity;
```

Next, we will update the `AddToCart` component to display the `ProductQuantity` component mentioned above upon clicking the "Add to cart" button. To achieve this, we will retrieve the `selectedQuantity` and `setSelectedQuantity` from the cart items store. The `AddToCart` component will be displayed if `selectedQuantity` is nil; otherwise, the `ProductQuantity` component will be displayed. When the user clicks the "Add to cart" button, we will initialize the product quantity for the given `slug` to `1`.

```js
import { Button } from "neetoui";
import { isNil, paths } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";
import { shallow } from "zustand/shallow";

import ProductQuantity from "./ProductQuantity";

const AddToCart = ({ slug }) => {
  const [selectedQuantity, setSelectedQuantity] = useCartItemsStore(
    paths([["cartItems", slug], ["setSelectedQuantity"]]),
    shallow
  );

  const handleClick = e => {
    e.stopPropagation();
    e.preventDefault();
    setSelectedQuantity(slug, 1);
  };

  if (isNil(selectedQuantity)) {
    return <Button label="Add to cart" size="large" onClick={handleClick} />;
  }

  return <ProductQuantity {...{ slug }} />;
};

export default AddToCart;
```

Given that we're duplicating the code to retrieve `selectedQuantity` and `setSelectedQuantity` in both the `AddToCart` and `ProductQuantity` components, let's extract this logic into a custom hook. Let's create a hook named `useSelectedQuantity` under `src/components/hooks` for this:

```bash
mkdir src/components/hooks
touch src/components/hooks/useSelectedQuantity.js
```

We'll structure the hook to allow the use of the `setSelectedQuantity` function without the need to pass the `slug` each time. Instead, we'll accept the `slug` as an argument to this hook.

```js
import { paths } from "ramda";
import useCartItemsStore from "stores/useCartItemsStore";
import { shallow } from "zustand/shallow";

const useSelectedQuantity = slug => {
  const [selectedQuantity, setSelectedQuantity] = useCartItemsStore(
    paths([["cartItems", slug], ["setSelectedQuantity"]]),
    shallow
  );

  const updateSelectedQuantity = quantity =>
    setSelectedQuantity(slug, quantity);

  return { selectedQuantity, setSelectedQuantity: updateSelectedQuantity };
};

export default useSelectedQuantity;
```

Now, you can invoke the `useSelectedQuantity` hook from both the `AddToCart` and `ProductQuantity` components instead of directly using the `useCartItemsStore` hook. Additionally, there's no need to pass `slug` to the `setSelectedQuantity` function.

Now, lets update `AddToCart` component.

```jsx {1, 4-5, 10}
import useSelectedQuantity from "components/hooks/useSelectedQuantity";
//...

const AddToCart = ({ slug, availableQuantity }) => {
  const { selectedQuantity, setSelectedQuantity } = useSelectedQuantity(slug);

  const handleClick = e => {
    e.stopPropagation();
    e.preventDefault();
    setSelectedQuantity(1);
  };

  //...
}
```

Similarly, update the `ProductQuantity` component as well.

```jsx {1, 7, 16, 24}
import useSelectedQuantity from "components/hooks/useSelectedQuantity";
//...

const ProductQuantity = ({ slug, availableQuantity }) => {
  // ...

  const { selectedQuantity, setSelectedQuantity } = useSelectedQuantity(slug);

  //...
  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
    <Button
      // ...
      onClick={e => {
        preventNavigation(e);
        setSelectedQuantity(selectedQuantity - 1);
      }}
    />
    {selectedQuantity}
    <Button
      //...
      onClick={e => {
        preventNavigation(e);
        setSelectedQuantity(selectedQuantity + 1);
      }}
    />
    </div>
  )

}
```

At this stage, upon clicking the "Add to Cart" button, you should be able to view the `ProductQuantity` component and subsequently update the quantity as needed.

In the real world, each product has a capped availability, and we must prevent users from increasing the count beyond that limit. To achieve this, we will disable the `+` button of the `ProductQuantity` when the selected quantity equals the available quantity. For this, the `ProductQuantity` component should be aware of the available quantity of the corresponding product.

We will obtain the available quantity for each product from the products array in the `ProductList` component. As we pass the entire product details to the `ProductListItem` component, we can destructure this value from the `ProductListItem` props and pass it down to `ProductQuantity` through the `AddToCart` component.

```jsx {6, 13}
const ProductListItem = ({
  imageUrl,
  name,
  offerPrice,
  slug,
  availableQuantity,
}) => (
  <Link
    className="neeto-ui-border-black neeto-ui-rounded-xl flex w-48 flex-col items-center justify-between border p-4"
    to={buildUrl(routes.products.show, { slug })}
  >
    {/* Remaining JSX */}
    <AddToCart {...{ availableQuantity, slug }} />
  </Link>
);
```

We can destructure the available quantity directly from the response in the `Product` component:

```js {8}
  const {
    name,
    description,
    mrp,
    offerPrice,
    imageUrl,
    imageUrls,
    availableQuantity,
  } = product;
```

Pass the `availableQuantity` prop to the `AddToCart` component from both `Product` and `ProductListItem` components:

```js
<AddToCart {...{ availableQuantity, slug }} />
```

We can then pass the prop down to the `ProductQuantity` component:

```jsx
const AddToCart = ({ slug, availableQuantity }) => {
  // remaining code
  return <ProductQuantity {...{ slug, availableQuantity }} />;
};
```

Utilizing the `availableQuantity` prop, we can disable the increment button of the `ProductQuantity` component when the `selectedQuantity` reaches the `availableQuantity`:

```jsx {4, 16}
const ProductQuantity = ({ slug, availableQuantity }) => {
  const { selectedQuantity, setSelectedQuantity } = useSelectedQuantity(slug);

  const isNotValidQuantity = selectedQuantity >= availableQuantity;

  const preventNavigation = e => {
    e.stopPropagation();
    e.preventDefault();
  };

  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
      {/* remaining JSX */}
      <Button
        className="focus-within:ring-0"
        disabled={isNotValidQuantity}
        label="+"
        style="text"
        onClick={e => {
          preventNavigation(e);
          setSelectedQuantity(selectedQuantity + 1);
        }}
      />
    </div>
  );
};
```

To enrich the user experience, it's crucial to offer clear feedback when a button is disabled, providing information on why a certain action cannot be performed. To achieve this, we'll implement a tooltip to be displayed when the increment button is disabled. For this, we can utilize the [Tooltip](https://neeto-ui.neeto.com/?path=/docs/overlays-tooltip--docs) component from neeto-ui:

<image>tooltip-requirement.png</image>

Typically, the [Tooltip](https://neeto-ui.neeto.com/?path=/docs/overlays-tooltip--docs) component displays the provided content when a user hovers over the element wrapped by it. However, in this case, wrapping the `Button` component won't display the content directly because disabled buttons won't trigger any events. To address this, we will enclose the `Button` component within a `div` element to enable the tooltip functionality.

We'll abstract this functionality into a reusable component called `TooltipWrapper`. Instead of directly wrapping the `Button` with the tooltip, we can use this component. To ensure the tooltip is displayed only when the button is disabled, we'll introduce a `showTooltip` prop for conditional rendering in the `TooltipWrapper`.

```jsx
// src/components/commons/TooltipWrapper.jsx
import { Tooltip } from "neetoui";

const TooltipWrapper = ({ showTooltip, children, ...tooltipProps }) => {
  if (!showTooltip) return children;

  return (
    <Tooltip {...tooltipProps}>
      <div>{children}</div>
    </Tooltip>
  );
};

export default TooltipWrapper;
```

Now export the `TooltipWrapper` component from the `commons` folder. Add the following line to the `commons/index.js` file.

```js {5, 7}
import AddToCart from "./AddToCart";
import Header from "./Header";
import PageLoader from "./PageLoader";
import PageNotFound from "./PageNotFound";
import TooltipWrapper from "./TooltipWrapper";

export { Header, PageNotFound, PageLoader, AddToCart, TooltipWrapper };
```

Now, in the `ProductQuantity` component we can show a tooltip by enclosing the `+` button with `TooltipWrapper` and providing the required props. As we only want the tooltip to appear when the button is disabled, we'll set the `showTooltip` prop to `isNotValidQuantity`:

```jsx {1, 10-25}
import { TooltipWrapper } from "components/commons";
//...

const ProductQuantity = ({ slug, availableQuantity }) => {
  //...
  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
      {/* remaining JSX */}

      <TooltipWrapper
        content="Reached maximum units"
        position="top"
        showTooltip={isNotValidQuantity}
      >
        <Button
          className="focus-within:ring-0"
          disabled={isNotValidQuantity}
          label="+"
          style="text"
          onClick={e => {
            preventNavigation(e);
            setSelectedQuantity(selectedQuantity + 1);
          }}
        />
      </TooltipWrapper>
    </div>
  );
};

export default ProductQuantity;
```

Verify if the tooltip is being displayed when the selected quantity equals the available quantity.

To further improve the user experience, instead of displaying the selected quantity as text, we will turn it into an input component. This allows users to directly input the desired quantity without repeatedly clicking the `+` button. We will use the [Input](https://neeto-ui.neeto.com/?path=/docs/components-input--docs) component from neeto-ui. We will pass the `preventNavigation` function as its click handler.

```jsx {1, 17-23}
import { Input } from "neetoui";

const ProductQuantity = ({ slug, availableQuantity }) => {
  // remaining code

  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
      <Button
        className="focus-within:ring-0"
        label="-"
        style="text"
        onClick={e => {
          preventNavigation(e);
          setSelectedQuantity(selectedQuantity - 1);
        }}
      />
      <Input
        nakedInput
        className="ml-2"
        contentSize="2"
        value={selectedQuantity}
        onClick={preventNavigation}
      />
      {/* remaining JSX */}
    </div>
  );
};
```

Given that the input component manages its value as a string, we'll also store the quantity as a string in our store. To prevent the removal of items when a user types in a value, we'll implement a condition to check whether the quantity is empty or not. We only need to check the quantity value when the input is not an empty string. We can achieve this using the [isNotEmpty](https://github.com/bigbinary/neeto-cist/blob/main/docs/pure/general.md#isnotempty) function from `neetocist`.

```jsx {1, 8, 12}
import { isNotEmpty } from "neetocist";
// remaining imports

const useCartItemsStore = create(set => ({
  cartItems: {},
  setSelectedQuantity: (slug, quantity) =>
    set(({ cartItems }) => {
      if (quantity <= 0 && isNotEmpty(quantity)) {
        return { cartItems: dissoc(slug, cartItems) };
      }

      return { cartItems: assoc(slug, String(quantity), cartItems) };
    }),
}));
```

To guarantee the proper functionality of the `ProductQuantity` component after incorporating the input component, it's crucial to parse the string input to an integer and verify whether the user input is within the specified limits. If not, we'll display a [Toastr](https://neeto-ui.neeto.com/?path=/docs/overlays-toastr--docs) indicating the available quantity of the product:

<image>error-toastr-available-quantity.gif</image>

We will need to add the `ToasterContainer` from [react-toastify](https://fkhadra.github.io/react-toastify/introduction) package for `Toastr` component from `neetoUI` to work. We have installed the `react-toastify` package as a dependency while installing `neetoUI`. We only need to import `ToastrContainer` and add it in the `src/index.jsx` file:

```jsx {1, 8}
import { ToastContainer } from "react-toastify";
// remaining imports

// ...
root.render(
  <React.StrictMode>
      <BrowserRouter>
        <ToastContainer />
        <App />
      </BrowserRouter>
  </React.StrictMode>
);
```

Now, let's define a change handler for the `Input` component in the `ProductQuantity` component to implement logic to parse and validate user input as discussed above:

```jsx {1, 9-19, 32}
import { Toastr } from "neetoui";
import useSelectedQuantity from "components/hooks/useSelectedQuantity";
//...

const ProductQuantity = ({ slug, availableQuantity }) => {
  const { selectedQuantity, setSelectedQuantity } = useSelectedQuantity(slug);
  //...

  const handleSetCount = event => {
    const { value } = event.target;
    const isNotValidInputQuantity = parseInt(value) > availableQuantity;

    if (isNotValidInputQuantity) {
      Toastr.error(`Only ${availableQuantity} units are available`, { autoClose: 2000 });
      setSelectedQuantity(availableQuantity);
    } else {
    setSelectedQuantity(value);
    }
  };

  //...

  return (
    {/* remaining JSX */}

    <Input
      nakedInput
      className="ml-2"
      contentSize="2"
      value={selectedQuantity}
      onClick={preventNavigation}
      onChange={handleSetCount}
    />

    {/* remaining JSX */}
  );
};
```

We should also ensure that the user doesn't input anything other than digits before updating the quantity in the store. To achieve this, we can define a regex to check whether the input is a digit or an empty string within the `constants` file inside the components directory.

```js
// src/components/constants
export const VALID_COUNT_REGEX = /^(?:\d*|)$/;
```

In the `handleSetCount` function, we can test the input against the above regex and update the store only if the input matches the regex:

```js {8-10}
const handleSetCount = event => {
  const { value } = event.target;
  const isNotValidInputQuantity = parseInt(value) > availableQuantity;

  if (isNotValidInputQuantity) {
    Toastr.error(`Only ${availableQuantity} units are available`, { autoClose: 2000 });
    setSelectedQuantity(availableQuantity);
  } else if (VALID_COUNT_REGEX.test(value)) {
    setSelectedQuantity(value);
  }
};
```

To prevent input from the user after entering a quantity outside the limit, we will shift the focus away from the input component by triggering the `onBlur` event. This can be accomplished by using the `useRef` hook to reference the `Input` component.

```jsx {1, 5, 15, 30}
import { useRef } from "react";
// ...

const ProductQuantity = ({ slug, availableQuantity }) => {
  const countInputFocus = useRef(null);
  // ...

  const handleSetCount = event => {
    const { value } = event.target;
    const isNotValidInputQuantity = parseInt(value) > availableQuantity;

    if (isNotValidInputQuantity) {
      Toastr.error(`Only ${availableQuantity} units are available`, { autoClose: 2000 });
      setSelectedQuantity(availableQuantity);
      countInputFocus.current.blur();
    } else if (VALID_COUNT_REGEX.test(value)) {
      setSelectedQuantity(value);
    }
  };

  // ...

  return (
    <div className="neeto-ui-border-black neeto-ui-rounded inline-flex flex-row items-center border">
      {/* remaining JSX */}
      <Input
        nakedInput
        className="ml-2"
        contentSize="2"
        ref={countInputFocus}
        value={selectedQuantity}
        onChange={handleSetCount}
        onClick={preventNavigation}
      />
      {/* remaining JSX */}
    </div>
  );
};
```

To ensure that the increment and decrement buttons work as expected after converting the quantity to a string, we should parse an integer from the `selectedQuantity` value from the store. This parsed value should be used to increment and decrement the quantity. Otherwise, clicking the button would simply append `1` to the quantity since the `+` acts as a concatenation operator for strings. We will also utilize this parsed value to set the `isNotValidQuantity` variable, which is used to disable the `+` button.

```jsx {6-7}
const ProductQuantity = ({ slug, availableQuantity }) => {
  const countInputFocus = useRef(null);

  const { selectedQuantity, setSelectedQuantity } = useSelectedQuantity(slug);

  const parsedSelectedQuantity = parseInt(selectedQuantity) || 0;
  const isNotValidQuantity = parsedSelectedQuantity >= availableQuantity;

  // remaining code
}
```

Now, instead of calling the `setSelectedQuantity` using `selectedQuantity`, we will use the `parsedSelectedQuantity` on button clicks:

```js
// "-" button
setSelectedQuantity(parsedSelectedQuantity - 1);

// "+" button
setSelectedQuantity(parsedSelectedQuantity + 1);
```

Great job! You've successfully added the ability to set the quantity of cart items.

Finally, we will store the cart items and quantity details in [local storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) to persist data after a reload. This ensures that users can view the products added to the cart on their next visit. Zustand provides the [persist middleware](https://github.com/pmndrs/zustand/blob/main/docs/integrations/persisting-store-data.md) to store the Zustand state in storage. Let's utilize this middleware to persist the cart items store in local storage:

```js {2, 5, 17-18}
// remaining imports
import { persist } from "zustand/middleware";

const useCartItemsStore = create(
  persist(
    set => ({
      cartItems: {},
      setSelectedQuantity: (slug, quantity) =>
        set(({ cartItems }) => {
          if (quantity <= 0 && isNotEmpty(quantity)) {
            return { cartItems: dissoc(slug, cartItems) };
          }

          return { cartItems: assoc(slug, String(quantity), cartItems) };
        }),
    }),
    { name: "cart-items-store" }
  )
);

export default useCartItemsStore;
```

Now, you can view the details of the cart items even after reloading the page.

<image>persist-middleware.png</image>

Let's commit the new changes:

```bash
git add -A
git commit -m "Added ability to set quantity of cart items"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/bd275e109119a46f087c0659bea90f49d6460ecb).
