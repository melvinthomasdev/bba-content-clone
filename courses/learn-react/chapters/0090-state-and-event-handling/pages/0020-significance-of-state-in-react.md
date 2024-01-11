In the previous lesson, we used the concept of state from React to store and update the current image index using the `useState` hook:

```js
import { useState } from "react";

const Carousel = () => {
  const [currentIndex, setCurrentIndex] = useState(0);

  const handleNext = () => {
    const nextIndex = (currentIndex + 1) % imageUrls.length;
    setCurrentIndex(nextIndex);
  }

  // rest of the code
}
```

Have you ever thought, why do we even need a state? Can't we use a local variable inside the component and update it directly, as shown below:

```js
const Carousel = () => {
  let currentIndex = 0;

  const handleNext = () => {
    currentIndex = (currentIndex + 1) % imageUrls.length;
  }

  // rest of the code
}
```

Let's investigate this by replacing state with a local variable in the `Carousel` component. For the sake of simplicity, here we have shown a minimal version of the `Carousel` component to test this out:

<codeblock language="reactjs" packages="tailwindcss" type="lesson" showConsole="true">
<code>
const Carousel = () => {
  let currentIndex = 0;

  const handleNext = () => {
    currentIndex = (currentIndex + 1) % IMAGE_URLS.length;
    console.log(currentIndex);
  };

  const handlePrevious = () => {
    currentIndex = (currentIndex - 1 + IMAGE_URLS.length) % IMAGE_URLS.length;
    console.log(currentIndex);
  };

  return (
    <div className="flex flex-col items-center">
      <div className="flex items-center">
        <button className="mr-2" onClick={handlePrevious}>{"<"}</button>
        <img
          alt="Infinix Inbook"
          className="w-48"
          src={IMAGE_URLS[currentIndex]}
        />
        <button className="ml-2" onClick={handleNext}>{">"}</button>
      </div>
    </div>
  );
};

const IMAGE_URLS = [
  "https://i.dummyjson.com/data/products/9/thumbnail.jpg",
  "https://i.dummyjson.com/data/products/9/1.jpg",
  "https://i.dummyjson.com/data/products/9/2.png",
  "https://i.dummyjson.com/data/products/9/3.png",
];

export default Carousel;
</code>
</codeblock>

Now, check if the `Carousel` component works as before. You can see that the `currentIndex` variable gets updated and logged into the console, but the UI remains the same. This happens because the changes to the local variables **don't trigger a re-render** to update the component with the new data.

Even if our component was somehow re-rendered, changes to the local variables **won't persist between re-renders**. This is because every time React wants to re-render the `Carousel` component, it invokes the `Carousel` **function** again. As you might already know, calling a function will initialize all the local variables defined within it afresh. Therefore, every time React re-render the `Carousel` component, the local variable `currentIndex` will get reset to `0`.

React state overcomes the above limitations of the local variables using:

 - A **state variable** to retain the data between renders, and
 - A **state setter function** to update the variable and trigger React to render the component again.

The `useState` hook acts as an interface to access the React state.

When a component is invoked for the first time, the `useState` hook creates a state and assigns the initial value passed to it. React will then build all the necessary DOM nodes corresponding to the component using the initial value of the state variable. In our case, the `currentIndex` state variable is initialized with the value `0`, and the initial JSX is returned, with the first image URL set as the value for the `src` attribute.

Eventually, when we invoke the state setter function `setCurrentIndex`, we are telling React to update the state variable `currentIndex` and trigger a re-render. React then generates a new description of the UI with the latest value of the state variable by invoking the component function again.

It is essential to understand that React doesn't alter the entire component's browser DOM during state updates. Instead, it compares the React elements generated after the state update with the previous one, updating only the parts of the DOM that require changes.

For the `Carousel` component, these changes involve updating the `src` prop of the `img` tag and altering the background colors of the appropriate `span` elements. React executes these changes using primitive JavaScript methods under the hood. The following is a simplified overview of the DOM updates that occur behind the scenes for our `Carousel` component.

```js
// simplified version of the DOM update

image.setAttribute("src", IMAGE_URLS[1]);
previousDot.setAttribute("background-color", "white");
currentDot.setAttribute("background-color", "black");
```

The above process is summarized in the following diagram:

<image>core-react-loop.jpeg</image>

## Avoid creating unnecessary states

Despite the discussed limitations of local variables, there are scenarios where we prefer them over state variables.

Consider the `UserForm` component below, which contains a state variable `birthDate` and renders the `age` of the user along with `birthDate`. In this scenario, it is unnecessary to create a separate state variable for holding the value `age`. Since `age` can always be deduced from `birthDate`, we can use a local variable to calculate its value during every re-render. Also, there will never be a case where we want to change `age` alone and trigger a re-render. So `setAge` doesn't make any sense while we have `setBirthDate` already in place.

```jsx {4-5}
const UserForm = () => {
  const [birthDate, setBirthDate] = useState(new Date("1999-01-01"));

  const currentDate = new Date();
  const age = currentDate.getFullYear() - birthDate.getFullYear();

  return (
    <>
      {/* remaining JSX */}
      DOB: {birthDate}
      Age: {age}
    </>
  );
};
```

As illustrated in the above example, whenever we can derive something from existing props or states, we should calculate it during rendering itself instead of creating a new state. This way, we can avoid unnecessary re-rendering of components due to state updates, making the code faster and simpler. Also, minimizing the number of degrees of freedom of the component makes them more reliable.

The changes to the `Carousel` components were just for learning purposes. So, let's clean up those changes by running the following command:

```bash
git reset --hard
```
