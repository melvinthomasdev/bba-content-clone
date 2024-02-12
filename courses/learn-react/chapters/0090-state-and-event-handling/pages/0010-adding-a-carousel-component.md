In the previous lesson, we created a `Product` component to display the details of a product along with its image. In this lesson, we will extend the `Product` component to display a set of images as a carousel instead of a single image:

<image>carousel-prev-next-handlers.gif</image>

To achieve this, we will create a new component, `Carousel`, and then use it in the `Product` component. The `Carousel` component should display an image along with two arrow buttons. Additionally, it should update the displayed image when the user interacts with the arrow buttons.

Rather than constructing the entire component in one go, we will adopt an incremental approach by building the component as small and implementable layers.

Let’s get started by creating a `Carousel.jsx` file for this component:

```bash
touch src/components/Carousel.jsx
```

As the first step, we will display an image along with two arrow buttons. We will use the [Button](https://neeto-ui.neeto.com/?path=/docs/components-button--default) component from neeto-ui along with Left and Right icons from [neeto-icons](https://neeto-icons.neeto.com/) for previous and next buttons. For the `Carousel` component to be reusable, we will add an `imageUrls` prop to receive a set of URLs as an array of strings. Initially, we can display the first image from the `imageUrls` we have passed.

```jsx
import { Left, Right } from "neetoicons";
import { Button } from "neetoui";

const Carousel = ({ imageUrls }) => (
  <div className="flex items-center">
    <Button
      className="shrink-0 focus-within:ring-0 hover:bg-transparent"
      icon={Left}
      style="text"
    />
    <img
      className="max-w-56 h-56 max-h-56 w-56"
      src={imageUrls[0]}
    />
    <Button
      className="shrink-0 focus-within:ring-0 hover:bg-transparent"
      icon={Right}
      style="text"
    />
  </div>
);

export default Carousel;
```

By keeping the principles of [web accessibility](https://www.w3.org/WAI/fundamentals/accessibility-intro/) in mind, we will add the `alt` attribute to the `img` tag to display an alternate text if the image doesn't load. This text will also be used by the screen readers to read the content loud for the visually impaired readers. We will add a `title` prop to the `Carousel` component for the same:

```jsx {4, 12}
import { Left, Right } from "neetoicons";
import { Button } from "neetoui";

const Carousel = ({ imageUrls, title }) => (
  <div className="flex items-center">
    <Button
      className="shrink-0 focus-within:ring-0 hover:bg-transparent"
      icon={Left}
      style="text"
    />
    <img
      alt={title}
      className="max-w-56 h-56 max-h-56 w-56"
      src={imageUrls[0]}
    />
  {/* remaining code */}
)
```

We can use this component inside our `Product` component to display a Carousel. For that, we need a set of images. We can use some dummy images from the internet for the same:

- https://i.dummyjson.com/data/products/9/thumbnail.jpg
- https://i.dummyjson.com/data/products/9/1.jpg
- https://i.dummyjson.com/data/products/9/2.png
- https://i.dummyjson.com/data/products/9/3.png

Let us create a constant array of these URLs. At Bigbinary, we follow the convention of naming constants in `UPPER_SNAKE_CASE` and grouping them within a file `constants.js`. Following this convention, let's create a `constants.js` file within `src/components` and place the above URLs into an array:

```js
export const IMAGE_URLS = [
  "https://i.dummyjson.com/data/products/9/thumbnail.jpg",
  "https://i.dummyjson.com/data/products/9/1.jpg",
  "https://i.dummyjson.com/data/products/9/2.png",
  "https://i.dummyjson.com/data/products/9/3.png",
];
```

Now, we can replace the `img` tag in the `Product` component with the `Carousel` component:

```jsx {1-2, 8}
import Carousel from "./Carousel";
import { IMAGE_URLS } from "./constants";

const Product = () => (
  <div className="px-6 pb-6">
    {/* rest of the code */}
    <div className="w-2/5">
      <Carousel title="Infinix Inbook" imageUrls={IMAGE_URLS} />
    </div>
    {/* rest of the code */}
  </div>
);

export default Product;
```

Our next goal is to add interactivity to the `Carousel` component by enabling users to navigate between product images by clicking the arrow buttons.

Let's break down this requirement further:

- Currently, we are passing the URL at the `0`th index of the `imageUrls` array as the `src` prop. Instead of hardcoding `0`, we need to make the array index dynamic. Whenever this index changes, we need to re-render the image with the new src URL. To achieve this, we will use a React feature called **State**.

- Next, we need to increment or decrement the index when the user clicks on the next or previous buttons. For that, we need to listen to button clicks. We will learn the concept of **Event handlers** in React to achieve this.

## State in React

To store dynamic values associated with a component, we can use the concept of state from React. React state stores a value, keeps track of its changes, and updates the user interface accordingly.

Most of React's powerful features, including states, are made accessible through special functions known as **hooks**. One such essential hook is `useState`, which enables us to create states. It accepts an initial value and returns an array containing the current value of the state variable and a function to update this state variable. Here is the syntax for using the `useState` function:

```js
const [state, setState] = useState(initialValue);
```

Here we have [destructured](https://courses.bigbinaryacademy.com/learn-javascript/array-destructuring/destructuring-array-elements/) the array returned by the `useState` function to the variables `state` and `setState`. The first destructured variable is the name of the item we're tracking. The second variable prefixes that name with `set`, signifying that it's a function that can be invoked to update the tracked item. This function is sometimes referred to as a **setter function** since it sets the new value for the state variable.

We can name these variables whatever we want. However, it is a convention followed across the React community to name the setter function as `set` followed by the state variable name.

For example, we can name the state variable to store the current image index in our `Carousel` component as `currentIndex` and the setter function as `setCurrentIndex`. Since we need to display the first image from the `imageUrls` array on page load, we will set the initial value of `currentIndex` as `0`:

```js
const [currentIndex, setCurrentIndex] = useState(0);
```

Let's add the state variable `currentIndex` to our `Carousel` component using the `useState` hook:

```jsx {1,5,12}
import { useState } from "react";
// remaining import statements

const Carousel = ({ imageUrls, title }) => {
  const [currentIndex, setCurrentIndex] = useState(0);

  return (
    // remaining code
    <img
      alt={title}
      className="max-w-56 h-56 max-h-56 w-56"
      src={imageUrls[currentIndex]}
    />
    // remaining code
  );
};

export default Carousel;
```

There are a couple of rules that we need to follow while using `hooks`:

 - Hooks should only be called within React components. It is not valid to call hooks outside components.
 - Hooks should be called at the top level of the React component, before any early returns. This means that hooks cannot be called inside loops, conditions, or nested functions.

## Event handling

You might be familiar with handling [events](https://courses.bigbinaryacademy.com/learn-htmldom/browser-events/browser-events) in JavaScript. In JavaScript, browser events are handled by attaching event listeners to DOM elements:

```js
const button = document.getElementById("buttonId");

const handleClick = () => {
  // code to be executed on button click
}

button.addEventListener("click", handleClick);
```

HTML offers another way to handle events using event attributes:

```html
<button onclick="handleClick()">Click</button>
```

React follows a pattern similar to HTML for event handling, but there are two key distinctions:

 - React event handler props are named using **camelCase** instead of lowercase like, `onClick`, `onChange`, `onKeyDown`, etc.
 - With JSX, we pass the **function reference** as the event handler instead of a string.

Here is an example of handling an event in React:

```jsx
const Component = () => {
  const handleClick = () => {
    // code to be executed on button click
  }

  return <button onClick={handleClick}>Click</button>
}
```

Let's jump into adding event handlers for the buttons in the `Carousel` component.

We need to increment the `currentIndex` when the user clicks the right arrow button and decrement it when clicking the left arrow. To ensure that the value of `currentIndex` stays within the array index range, we should take the modulus with the array length. We can utilize the `setCurrentIndex` function to update the currentIndex:

```jsx {4-7, 9-12, 20, 31}
const Carousel = ({ imageUrls, title }) => {
  const [currentIndex, setCurrentIndex] = useState(0);

  const handleNext = () => {
    const nextIndex = (currentIndex + 1) % imageUrls.length;
    setCurrentIndex(nextIndex);
  }

  const handlePrevious = () => {
    const previousIndex = (currentIndex - 1 + imageUrls.length) % imageUrls.length;
    setCurrentIndex(previousIndex);
  }

  return (
    <div className="flex items-center">
      <Button
        className="shrink-0 focus-within:ring-0 hover:bg-transparent"
        icon={Left}
        style="text"
        onClick={handlePrevious}
      />
      <img
        alt={title}
        className="max-w-56 h-56 max-h-56 w-56"
        src={imageUrls[currentIndex]}
      />
      <Button
        className="shrink-0 focus-within:ring-0 hover:bg-transparent"
        icon={Right}
        style="text"
        onClick={handleNext}
      />
    </div>
  );
};

export default Carousel;
```

Go ahead and open your application to confirm the changes. You should now be able to navigate between the product images:

<image>carousel-prev-next-handlers.gif</image>

Let's reinforce what we have learned so far by adding an indicator to navigate between images:

<image>carousel-dots.gif</image>

Following are the steps to accomplish the above requirement:

1. Display a set of dots indicating the number of images in the `imageUrls`.
2. Clicking each dot should update the `currentIndex`. For example, clicking the 1st dot should update the `currentIndex` to 0, clicking the 2nd dot should update the `currentIndex` to 1 and so on.
3. Based on the `currentIndex`, change the color of the dot corresponding to the current image to black.

Before jumping straight into the solution, try to solve this yourself, with the knowledge about state and events handling.

### Solution

Let’s see how we can add the dot indicator to our `Carousel` component.

1. First, we will map over the `imageUrls` array to display a set of dots. Note that here, we have passed the index as the key. In this case, it is okay to pass the index as key since the `imageUrls` is a constant array that won't ever change.

    ```jsx
    // remaining code
    return (
      <div className="flex flex-col items-center">
        {/* previous JSX returned by Carousel component as it is */}
        <div className="flex space-x-1">
          {imageUrls.map((_, index) => (
            <span
              className="neeto-ui-border-black neeto-ui-rounded-full h-3 w-3 cursor-pointer border"
              key={index}
            />
          ))}
        </div>
      </div>
    );
    ```

2. Next, we will add an `onClick` handler for each dot. We can pass the index of the corresponding dot as a parameter to the `setCurrentIndex` function. Here, as we need to pass the index parameter to the event handler, we need to define the event handler as an inline function.

    ```jsx {6}
    // remaining code
    {imageUrls.map((_, index) => (
      <span
        className="neeto-ui-border-black neeto-ui-rounded-full h-3 w-3 cursor-pointer border"
        key={index}
        onClick={() => setCurrentIndex(index)}
      />
    ))}
    ```

3. Finally, to highlight the position of the current image, we'll set a black background for the selected dot. We can achieve this by comparing the state variable `currentIndex` with the index of each dot and applying the class name `neeto-ui-bg-black` conditionally:

    ```jsx {3-10, 13}
    // Conditionally adding classnames without using "classNames" package
    {imageUrls.map((_, index) => {
      const defaultClasses =
        "neeto-ui-border-black neeto-ui-rounded-full h-3 w-3 cursor-pointer border";

      const dotClassNames =
        index === currentIndex
          ? defaultClasses.concat(" neeto-ui-bg-black")
          : defaultClasses;

      return (
        <span
          className={dotClassNames}
          key={index}
          onClick={() => setCurrentIndex(index)}
        />
      );
    })}
    ```

    However, we can avoid the hassle of writing the conditions as above by leveraging the [classNames](https://www.npmjs.com/package/classnames) package to apply classnames conditionally. This package provides a function called `classNames` that facilitates the conditional joining of class names.

    To install `classnames`, run the following command:

    ```bash
    yarn add classnames@2.3.1
    ```

    With the `classNames` function, we pass the classnames to include and the corresponding conditions as an object. In addition, the class names that should always be present are passed as a string.

    Here is what the code will look like with the `classNames` package. Much better, right?

    ```jsx {1, 6-9}
    import classNames from "classnames";

    // Conditionally adding classNames using "classnames" package
    // remaining code
    {imageUrls.map((_, index) => (
      <span
        key={index}
        className={classNames(
          "neeto-ui-border-black neeto-ui-rounded-full h-3 w-3 cursor-pointer border",
          { "neeto-ui-bg-black": index === currentIndex }
        )}
        onClick={() => {
          setCurrentIndex(index);
        }}
      />
    ))}
    ```

Hooray 🎉 ! We have learned the concepts of state and event handling in React and implemented a simple `Carousel` component.

Let's commit the new changes:

```bash
git add -A
git commit -m "Added Carousel component"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/1a5cb2b595319754f8bef9b2daaa3258c5f86dcf).
