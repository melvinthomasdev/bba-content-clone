At BigBinary, after adopting Zustand for state management, we encountered an issue with the boilerplate code required to access properties from the Zustand store. Retrieving specific properties involved cumbersome code, as illustrated below:

```js
import { shallow } from "zustand/shallow";

const { order, customer } = useGlobalStore(
  store => ({
    order: store[sessionId]?.globals.order,
    customer: store[sessionId]?.globals.customer,
  }),
  shallow
);
```

The above Zustand store usage involves a lot of boilerplate code just to access two properties from a store containing nested values.

To address this issue, we've developed a Babel preset named [`babel-preset-neeto`](https://github.com/bigbinary/babel-preset-neeto/tree/main).

As we already learned in the lesson [How JSX is converted to JS](https://courses.bigbinaryacademy.com/learn-react/more-on-jsx/how-jsx-is-converted-to-js/), Babel is a toolchain that is mainly used to convert ECMAScript 2015+ code into a backwards-compatible version of JavaScript in current and older browsers or environments. We also learned that Babel enables us to create custom presets and plugins to perform code transformations.

Using Babel, we have added support for custom syntax to access properties from the Zustand store. `babel-preset-neeto` contains two plugins: `zustand-pick` and `zustand-pick-from` that transform these simplified syntaxes into actual JavaScript syntax for accessing Zustand store during transpiling. Let's see how these plugins simplify the usage of Zustand stores.

## Zustand pick transformer

The Zustand `pick` transformer is used for picking multiple items from the Zustand store. Consider the code we saw at the beginning of this lesson:

```js
import { shallow } from "zustand/shallow";

const { order, customer } = useGlobalStore(
  store => ({
    order: store[sessionId]?.globals.order,
    customer: store[sessionId]?.globals.customer,
  }),
  shallow
);
```

With Zustand `pick` transformer, we can achieve the same effect as the above code by writing a simpler syntax as shown below:

```js
const { order, customer } = useGlobalStore.pick([sessionId, "globals"]);
```

The transformer will generate all the necessary boilerplate code for us during transpiling. Also, note that we don't need `import { shallow } from "zustand/shallow";` in our code. The plugin will automatically add it for us at the time of transpiling. Since the transformer adds optional chaining in all levels of nesting, you don't need to worry if any of the properties in your store nesting may be `null/undefined`.

You can learn about the various syntaxes supported by the `zustand-pick` transformer by referring to [the documentation](https://github.com/bigbinary/babel-preset-neeto/blob/main/docs/zustand-pick.md).

## Zustand pickFrom transformer

The Zustand `pickFrom` transformer was introduced to simplify the access of a single property from a store. Using this plugin, you can write the code to access the `order` property from the `useGlobalStore` as shown below:

```js
const order = useGlobalStore.pickFrom([sessionId, "globals"]);
```

The plugin will transform the above code into the following code:

```js
const order = useGlobalStore.(
  store => store[sessionId]?.["globals"]?.order
);
```

Refer [the documentation](https://github.com/bigbinary/babel-preset-neeto/blob/main/docs/zustand-pick-from.md) of `zustand-pick-from` plugin to learn about the supported syntaxes.

## Using `babel-preset-neeto` in our project.

1. Install `babel-preset-neeto`:

    ```bash
    yarn add @bigbinary/babel-preset-neeto@1.0.7
    ```

2. Add `bigbinary/neeto` preset to babel presets in the `package.json` file:

    ```js {6}
    {
      // ...
      "babel": {
        "presets": [
          "react-app",
          "@bigbinary/neeto"
        ]
      }
    }
    ```

    The presets array will include the [`"react-app"`](https://www.npmjs.com/package/babel-preset-react-app) preset, which was added during the app setup. This preset encompasses the plugin to transform `JSX` into plain JavaScript, along with other language features required by React.

    The presets are executed in reverse order, from last to first, in the presets array. Therefore, we should insert our Babel preset, `"@bigbinary/neeto"`, towards the end of the presets array in `package.json`. This ensures that the code transformations are applied directly to the source code written by developers.


3. Go through each of the `useCartItemsStore` usages and check whether we can utilize the Zustand transformers from `babel-preset-neeto`:

    -  **src/components/utils.js**

        ```js
        const { cartItems } = useCartItemsStore.getState();
        ```

        Looking at the above code, you might think that we can use `pickFrom` since we need to access a single property from Zustand as shown below:

        ```js
        const cartItems = useCartItemsStore.pickFrom();
        ```

        Here is how the above code will get transpiled:

        ```js
        const cartItems = useCartItemsStore(store => store.cartItems);
        ```

        However, this is not the requirement in `cartTotalOf` function. We specifically need to use the `getState` method to access the Zustand store outside components and hooks. Moreover, the `getState` function is used to access the state in a non-reactive way; it doesn't listen to changes in the Zustand store. Therefore, there is no chance of having boilerplate code to select and compare store values. Due to these reasons, we don't need to use transformers here.

    -  **Cart/index.jsx**

        ```js
        const { cartItems, setSelectedQuantity } = useCartItemsStore();
        ```

        In addition to the above properties, the cart items store has another property, `removeCartItem`. Therefore, we should use selector and comparator functions as shown:

        ```js
        import { shallow } from "zustand/shallow";

        const { cartItems, setSelectedQuantity } = useCartItemsStore(store => ({
          cartItems: store.cartItems,
          setSelectedQuantity: store.setSelectedQuantity
        }), shallow);
        ```

        With the transformer, we can simplify the above boilerplate code as shown:

        ```js
        const { cartItems, setSelectedQuantity } = useCartItemsStore.pick();
        ```

    -  **Cart/ProductCard.jsx**

        ```js
        const removeCartItem = useCartItemsStore(prop("removeCartItem"));
        ```

        Here we can use the `pickFrom` transformer to pick the `removeCartItem` property as shown:

        ```js
        const removeCartItem = useCartItemsStore.pickFrom();
        ```

    -  **Header.jsx**

        ```js
        const cartItemsCount = useCartItemsStore(
          store => keys(store.cartItems).length
        );
        ```

        In this case, we can't use a transformer since the transformers doesn't accept an expression as an argument. Therefore, we can keep the above usage as it is.

    -  **useSelectedQuantity.js**

        ```js
        const [selectedQuantity, setSelectedQuantity] = useCartItemsStore(
          paths([["cartItems", slug], ["setSelectedQuantity"]]),
          shallow
        );
        ```

        Here also, we can't use the transformer for the Zustand store usage, as the `pick` method only allows us to extract multiple properties at the same level of nesting. We will keep this Zustand store usage as it is.

Let's commit the new changes:

```bash
git add -A
git commit -m "Utilized babel-preset-neeto to access Zustand store properties"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/032ba6042318f3d22f924cbc8970ef7ff2d72773).
