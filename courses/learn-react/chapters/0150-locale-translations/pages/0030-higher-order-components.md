To understand Higher Order Components, it is essential to understand what are Higher Order Functions first.

## Higher Order Functions

Higher-order function (HOF) is a general concept that applies to many programming languages, including JavaScript. A higher order function is a function that takes one or more functions as arguments, or returns a function as its result.

Here is an example of a HOF that takes another function as argument:

<codeblock language="javascript" type="lesson">
<code>

const twice = (operation, value) => operation(operation(value));

const add3 = v => v + 3

console.log("Result is ", twice(add3, 1)) // will be 7

</code>
</codeblock>

In the above code, it takes the function called `operation` as an argument, and invokes it twice, where the second invocation uses the return value of first, that is inner, invocation of `operation`.

Here is another example where a HOF returns another function as its result:

<codeblock language="javascript" type="lesson">
<code>

const addX = x => y => x + y;

const add1 = addX(1)

console.log("Result is ", add1(5)) // will be 6

console.log("Result is ", addX(1)(5)) // this would also return 6

</code>
</codeblock>

## Higher Order Components

Now that you know what are Higher Order Functions (HOF), Higher Order Components (HOC) is a very similar concept. In a Higher Order Component, a function takes a component as an argument and returns a new component that wraps the original component. HOCs allow you to add additional functionality to a component without modifying the component's code.

Here's an example of a simple HOC `withLoading`, which takes a component,`WrappedComponent`, as input and returns a new component `WithLoading` that adds a loading prop to the `WrappedComponent`.

 <codeblock language="reactjs" type="lesson" >
 <code>

import React, { useState, useEffect } from 'react';

const withLoading = WrappedComponent => props => {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => setIsLoading(false), 3000); // Simulate API call
  }, []);

  if (isLoading) return <p>Loading...</p>;

  return <WrappedComponent {...props} />;
};


const MyComponent = () => <div>Content loaded!</div>;

const MyComponentWithLoading = withLoading(MyComponent);

// Usage
const App = () => (
    <div>
        <MyComponentWithLoading />
    </div>
);

export default App;


</code>
</codeblock>

## Why use Higher Order Components?

### Reusability

HOCs allow you to reuse component logic across multiple components, which can save time and reduce code duplication.

### Flexibility

Additional arguments can be taken in a HOC, which allows you to customize the behavior of the HOC. This makes them a flexible way to add functionality to your components.

### Separation of concern

HOCs can help separate concerns in your code by encapsulating certain functionality in a separate component. This can make the code easier to read and maintain.

### Composition

Multiple HOCs can be composed together to create more complex functionality. This allows you to build up functionality from smaller, reusable pieces.

### For Cross-Cutting Concerns

HOCs can be used to implement cross-cutting concerns in your application such as authentication, error handling, logging, performance tracking, and many other features.

## Common Use Cases for HOCs

HOCs are commonly utilized in various scenarios, such as:

### Authentication

In an application with various routes, some requiring user authentication, rather than replicating the authentication logic in every component or route, an HOC named `withAuth` can be implemented. This HOC checks user authentication and redirects unauthenticated users to a login page. Wrapping components or routes needing authentication with `withAuth` minimizes redundancy and ensures uniform authentication practices throughout the application.

### Logging

For logging data in components during mounting or updates, instead of inserting logging code into each component, a HOC named `withLogger` can be created. This HOC manages the logging operations. Applying withLogger to your components ensures consistent logging across them, streamlining the process and maintaining a cleaner codebase.

### Styling and Theming

In scenarios where your application utilizes a consistent design system, an HOC like `withTheme` can be beneficial. This HOC can supply components with theme-related properties. Consequently, any component wrapped with `withTheme` gains the ability to seamlessly adopt and implement the styles and themes defined in your design system.

### Adding Error Boundary

To enhance application stability and handle errors smoothly, the `withErrorBoundary` HOC can be implemented. This HOC captures JavaScript errors in its child component tree, logs those errors for debugging, and displays a fallback UI instead of allowing the entire component tree to crash.


## Conventions and best practices

### Naming conventions

Use the `with` prefix to make your HOCs easily recognizable, like `withAuth` or `withErrorHandler`.

### Maximizing HOC composability

We can leverage the power of Higher Order Components (HOCs) to enhance and extend the functionality of React components in a modular and scalable way. In the below example, this concept is demonstrated by combining two HOCs — `withUserData` and `withStyle` — to create an `EnhancedUserInfo` component.  We are utilizing the `compose` function from `ramda.js` to effectively merge `withStyle` and `withUserData`  into a single HOC.

```jsx
import React from 'react';
import { compose } from 'ramda';

// Base Component
const UserInfo = ({ user }) => (
    <div>
        <p>Name: {user.name}</p>
        <p>Email: {user.email}</p>
    </div>
);

// HOC to Fetch User Data
const withUserData = WrappedComponent => props => {
  // Simulating fetching data
  const userData = { name: 'John Doe', email: 'johndoe@example.com' };
  return <WrappedComponent {...props} user={userData} />;
};

// HOC to Apply Style
const withStyle = WrappedComponent => props => (
    <div classname="text-center text-blue-500">
        <WrappedComponent {...props} />
    </div>
);

const enhance = compose(
    withStyle,     // Applied second
    withUserData   // Applied first
);

const EnhancedUserInfo = enhance(UserInfo);

// App Component
const App = () => (
    <div>
        <EnhancedUserInfo />
    </div>
);

export default App;
```

### Avoid prop name collisions

Be mindful of prop names when using HOCs to avoid overwriting important data.

### Use `forwardRef`

While the convention for Higher Order Components is to pass through all props to the wrapped component, this does not work for refs. That’s because `ref` is not really a prop, it is rather a reference to the DOM element. So the solution is to  use `forwardRef` to pass refs through your HOC. You can learn more about `forwardRef` by referring this [link](https://courses.bigbinaryacademy.com/learn-react/miscellaneous/forward-ref).


In the upcoming lesson, we'll learn how to utilize HOCs in our application.
