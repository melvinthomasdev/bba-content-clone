React components go through a lifecycle consisting of three main phases: Mounting, Updating, and Unmounting. React allows us to monitor and perform specific actions during these phases. This helps us to manage the component's behavior and interactions with the DOM.

**Mounting:** The Mounting phase is the initial phase of a component's lifecycle. It occurs when a component is created and inserted into the DOM for the first time.

**Updating:** The Updating phase occurs when a component receives new props or updates its state, causing the component to re-render. This phase is essential for reflecting changes in the user interface.

**Unmounting:** This is the third and final phase of a component's lifecycle. It occurs when a component is removed from the DOM.

To understand the concept of component lifecycle, let’s look at an example where we are conditionally rendering the `Counter` component within the `App` component based on the `isCounterVisible` state variable. Clicking the `Mount Counter` button toggles `isCounterVisible`, displaying the `Counter` component if it's `true`. Users can increase the count with the `Increase count` button. Clicking `Unmount Counter` removes it from the DOM tree.

<codeblock language="reactjs" type="lesson" packages="tailwindcss">
<code>
import { useState } from "react";

const App = () => {
  const [isCounterVisible, setIsCounterVisible] = useState(false);

  const handleClick = () => setIsCounterVisible(isCounterVisible => !isCounterVisible);

  return (
    <div className="flex flex-col items-center justify-center min-h-screen">
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mt-4 rounded"
        onClick={handleClick}
      >
        {isCounterVisible ? "Unmount Counter" : "Mount Counter"}
      </button>
      {isCounterVisible && <Counter />}
    </div>
  );
};

const Counter = () => {
  const [count, setCount] = useState(0);

  const handleClick = () => setCount(prevCount => prevCount + 1);

  return (
    <div className="text-center mt-2 pt-6 border rounded-md shadow-lg">
      <p className="text-lg font-bold">Count = {count}</p>
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 mt-2 rounded"
        onClick={handleClick}
      >
        Increase count
      </button>
    </div>
  );
};

export default App;
</code>
</codeblock>

- When the `isCounterVisible` toggles to `true`, the `Counter` component renders for the first time or gets inserted into the DOM. This represents the mounting phase.

<image>mounting.gif</image>

- When we click on the `Increase count` button, the state updates and React re-renders the Counter component. This represents the updating phase.

<image>updating.gif</image>

- Clicking on the `Unmount Counter` button sets the `isCounterVisible` state to `false`. This results in the removal of the Counter component from the DOM. This represents the unmounting phase.

<image>unmounting.gif</image>

In the next lesson, we will learn about one of the powerful hooks in React, `useEffect` which lets us perform specific actions during these phases in the component lifecycle.
