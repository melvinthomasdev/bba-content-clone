Like any other technology, React applications are susceptible to errors. By default, React responds to a fatal error with a blank page, which can result in a poor user experience in the production environment. However, in a development environment, React provides a rich set of error messages.

This is how the error screen looks in the development environment.

<image>error-in-dev-env.png</image>

Fortunately, with the help of an error handling layer, we can override the default behavior of displaying a blank screen on your React application.

An error handling layer allows you to catch errors and display clear and helpful error messages to the user. Also, it encapsulates and centralizes error handling logic in one place. This is where React Error Boundaries come into play.

Error boundaries are React components that can catch JavaScript errors that occur during rendering, in lifecycle methods, and anywhere in the child component tree. This means we can wrap it around other components to catch any errors that occur within those components. They allow you to display a fallback UI component when an error occurs, which handles the error gracefully and avoids crashing the entire application.

### Creating an Error Boundary Component

To create an error boundary in React, you need to define a class component with `getDerivedStateFromError` and `componentDidCatch` lifecycle methods.

- `getDerivedStateFromError()`: This is invoked after an error has been thrown by one of its descendant components during the rendering phase. It's a static method, meaning it doesn't have access to the component instance. Instead, it's designed to return a value to update state. This method doesn't allow to perform any side effects.

- `componentDidCatch()`: This method helps you to catch errors and decide how to handle them. It is called during the commit phase, so side effects are permitted.

Let's start by creating a class called `ErrorBoundary` with state `isError` which is set to `false` to indicate that no errors have occurred initially. When an error is encountered during rendering, we'll utilize the `getDerivedStateFromError` method to set the `isError` state to `true`. If `isError` becomes `true`, we will render a fallback UI saying `Something went wrong`. Otherwise, renders the child components normally.

```jsx
import React, { Component } from "react";

class ErrorBoundary extends Component {
  constructor(props) {
    super(props);
    this.state = { isError: false };
  }

  static getDerivedStateFromError() {
    return { isError: true };
  }

  render() {
    if (this.state.isError) {
      return <h1>Something went wrong.</h1>;
    }

    return this.props.children;
  }
}

export default ErrorBoundary;
```

We also need to log the error to the console when it's caught. To achieve this, we will utilize the `componentDidCatch` method. It receives two parameters: `error`, which represents the error that was thrown, and `errorInfo`, an object containing information about which component threw the error.

```jsx
// ...
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isError: false };
  }
  // ...

  componentDidCatch(error, errorInfo) {
    console.log(error, errorInfo);
  }

  // ...
}

export default ErrorBoundary;
```

### Using Error Boundary

To implement an error handling layer in React, simply wrap your top-level app component with `ErrorBoundary`.

```jsx
<ErrorBoundary>
  <App />
</ErrorBoundary>
```

From now on, any JavaScript errors that occur in child components will now be logged to the console, and a `Something went wrong` message will be rendered. In the development environment, React continues automatically displaying the error screen. This is helpful for developers to debug and identify issues quickly.

Keep in mind that a React app can have multiple error boundaries. Each of them will take care of handling errors in different component subtrees. However, to centralize the error logic in one place, we should use only one top-level error boundary.
