Before React `16.8`, React class components were the only way to track component state and lifecycle; functional components were considered stateless. Class components are JavaScript object-oriented classes and are more complex to build than functional components. When React components needed to maintain their state, class components were used. Whereas functional components were mainly responsible for rendering UI by simply accepting data and displaying them in some form.

With the introduction of Hooks, functional components got capabilities nearly identical to class components.

This lesson discusses how we can implement the class components in React.

To implement a class component, we need to define a JavaScript class that inherits the `Component` class imported from React.

```jsx
import React, { Component } from "react";

class App extends Component {}
```

Inside the class component, we need to include a `render()` function where we specify the functionality of our component. The render function returns a JSX, which gets rendered every time we call that class component.

<codeblock language="reactjs" type="lesson">
<code>
import React, { Component } from "react";

class App extends Component {
  render() {
    return <h1>Hello world !!!</h1>;
  }
}

export default App;
</code>
</codeblock>

### State in Class Components

We initialize the state with the help of constructors. Constructors are special methods that initialize objects or variables whenever a class component is called. Within the `constructor`, the state is declared using the `this.state` property, which is assigned an object containing the initial values of the state variables. To access the state values, we need to use `this.state.value`. Additionally, it's essential to invoke `super()` within the constructor to call the constructor function of the parent class i.e. `React.component`. This allows us to access properties or variables inherited from the parent class.

<codeblock language="reactjs" type="lesson">
<code>
import React, { Component } from "react";

class App extends Component {
  constructor() {
    super();
    this.state = { username: "Oliver" };
  }

  render() {
    return (
      <>
        <h3>Hello {this.state.username}, Welcome to BigBinary Academy </h3>
      </>
    );
  }
}

export default App;
</code>
</codeblock>

To update the state, we need to use the `this.setState()` method. To the above example, we will implement a new function called `handleUpdate`, which is responsible for updating the state when called and a button to trigger the event.

<codeblock language="reactjs" type="lesson">
<code>
import React, { Component } from "react";

class App extends Component {
  constructor() {
    super();
    this.state = { username: "Oliver" };
  }

  handleUpdate = () => {
    this.setState({ username: "Mathew" });
  };

  render() {
    return (
      <>
        <h3>Hello {this.state.username}, Welcome to BigBinary Academy </h3>
        <button onClick={this.handleUpdate}>click to change name</button>
      </>
    );
  }
}

export default App;
</code>
</codeblock>

### Props in class components

The parent component can pass any data as props to its children similar to what we we have done in functional components. In the child component, we can access the passed props using `this.props`.

<codeblock language="reactjs" type="lesson">
<code>
import React, { Component } from "react";

class Example extends Component {
  render() {
    return <p>{this.props.text}</p>;
  }
}

class App extends Component {
  render() {
    return <Example text="hai" />;
  }
}

export default App;
</code>
</codeblock>

### Commonly used lifecycle methods

We have already discussed React's lifecycle phases in the [component lifecycle](https://courses.bigbinaryacademy.com/learn-react/side-effects/component-lifecycle) lesson. We have also seen how the `useEffect` hook aids in performing various actions during the different phases of a component's lifecycle. Lifecycle methods in class components serve functions similar to `useEffect`. `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount` are commonly used lifecycle methods. Let's look into each of them in detail.

#### componentDidMount()

This method is called once the component has been mounted into the DOM. Its functionality is similar to that of `useEffect` with an empty dependency array.

<codeblock language="reactjs" type="lesson">
<code>
import React, { Component } from "react";

class App extends Component {
  constructor() {
    super();
    this.state = { username: "Oliver" };
  }

  componentDidMount() {
    setTimeout(() => {
      this.setState({ username: "Mathew" });
    }, 1000);
  }

  render() {
    return (
      <>
        <h3>Hello {this.state.username}, Welcome to BigBinary Academy </h3>
      </>
    );
  }
}

export default App;
</code>
</codeblock>

When the component has been mounted, `componentDidMount` is called which triggers the `setTimeout` method.

#### componentDidUpdate()

Its functionality is similar to `useEffect` with a non-empty dependency array, except this method is not called for the initial render.

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
import React, { Component } from "react";

class App extends Component {
  constructor() {
    super();
    this.state = {
      count: 0,
    };
  }

  componentDidUpdate() {
    console.log("Count:", this.state.count);
  }

  handleUpdate = () =>
    this.setState(prevState => ({
      count: prevState.count + 1,
    }));

  render() {
    return <button onClick={this.handleUpdate}>Increment</button>;
  }
}

export default App;
</code>
</codeblock>

Whenever the `handleUpdate` method is called, the `count` state is incremented, triggering a re-render of the component. After the re-render, `componentDidUpdate` is called, and it logs the updated count value to the console.

#### componentWillUnmount()

This method is called just before the component is removed from the DOM. It allows you to perform any necessary cleanup such as invalidating timers, canceling network requests, etc. You should not call `setState` in `componentWillUnmount` because the component will never be re-rendered.

<codeblock language="reactjs" type="lesson">
<code>
import React, { Component } from "react";

class Child extends Component {
  componentWillUnmount() {
    alert("Unmounting child");
  }

  render() {
    return <h1>Hello World!</h1>;
  }
}

class App extends Component {
  constructor() {
    super();
    this.state = {
      showChild: true,
    };
  }

  handleDelete = () => {
    this.setState({ showChild: false });
  };

  render() {
    const { showChild } = this.state;

    return (
      <div>
        {showChild && <Child />}
        <button type="button" onClick={this.handleDelete}>
          Delete Child
        </button>
      </div>
    );
  }
}

export default App;
</code>
</codeblock>

When the user clicks the `Delete Child` button, the `handleDelete` function will be called which will update the `showChild` state to `false`. This causes the Child component to unmount and trigger the `componentWillUnmount` method, here we are displaying an alert to illustrate the cleanup process.
