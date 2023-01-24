As mentioned in the basics chapter, hooks are just functions that allow you to use React's state and lifecycle features from within.

We've already covered a couple of React's built-in hooks: `useState` and `useEffect`. But sometimes, you have a lot of stateful logic that you keep recycling and want to share between multiple components. This is where custom hooks come in handy.

A custom hook is simply a function that follows the rules of hooks:

1. **Only call hooks at the top level of the component:** As long as hooks aren't initialized inside loops or conditional statements, you ensure that the Hooks are called in the same order each time a component renders.

2. **Only call hooks from React functions:** Avoid calling a hook within a regular JS function. Calling hooks only within Components or other hooks ensures the rules of hooks remain transitive and that all hooks are visible.

It is very also very important to always begin your custom hook names with the prefix "use". Without it, React is unable to check for violations of the rules of hooks.

Custom hooks allow us to extract states, effects and other React code into a common function since we can't add them to regular functions.
