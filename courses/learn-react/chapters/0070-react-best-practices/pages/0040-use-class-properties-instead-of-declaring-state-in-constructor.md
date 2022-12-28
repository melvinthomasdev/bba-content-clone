In react we use state variables in class components and we set the initial state
values using constructor function.

```javascript
class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      name: this.props.name,
    };
  }
}
```

We can then access the state variables using `this.state` and update the state
variables using `this.setState`.

```javascript
// Access the state variable
this.state.name;

// Update state variable
this.setState({ name: "John Wick" });
```

When using
[Babel plugin](https://babeljs.io/docs/en/babel-plugin-proposal-class-properties)
that enables class properties we can skip the use of a class constructor. We can
rewrite the `App` class component without using constructor as:

```javascript
class App extends Component {
  state = {
    name: this.props.name,
  };
}
```

We can access or update the state variables as before.

```javascript
// Access the state variable
this.state.name;

// Update state variable
this.setState({ name: "John Wick" });
```
