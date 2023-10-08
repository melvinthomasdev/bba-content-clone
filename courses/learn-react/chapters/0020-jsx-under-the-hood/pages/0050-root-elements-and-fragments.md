As explained
[on the first page](https://courses.bigbinaryacademy.com/learn-react/your-first-component/basics-of-jsx/),
all JSX code requires a root element.

If you were to incorrectly try and return two tags together as shown below, it
will lead to an error:

```jsx
const WelcomeComponent = () => {
  return (
    <h1>Welcome to JSX</h1>
    <p>Please do enjoy your stay</p>
  )
}
```

Remember that all tags get transpiled into `React.createElement()` calls making
the above code equivalent to:

```jsx
const WelcomeComponent = () => {
  return (
    React.createElement("h1", null, "Welcome to JSX")
    React.createElement("p", null, "Please do enjoy your stay")
  )
}
```

Since you can't return two values from a return function, the above code is
invalid. To fix this, you could wrap your code in a `div` or a similar element
as shown:

```jsx
<div>
  <h1>Welcome to JSX</h1>
  <p>Please do enjoy your stay</p>
</div>
```

The above code now transpiles to the following JavaScript code:

```jsx
const WelcomeComponent = () => {
  return React.createElement(
    "div",
    null,
    React.createElement("h1", null, "Welcome to JSX"),
    React.createElement("p", null, "Please do enjoy your stay")
  );
};
```

But wrapping your code in a div is not always viable. A couple of examples are:

- When your JSX elements need to be styled by a CSS child selector from a parent
  tag or component.
- When your JSX consists of table rows to place inside a table.

You'll more often than not find yourself wanting to use your code without an
extra parent element, and here is where **React fragments** come to your rescue.
A React fragment looks like a tag with no name and can hold children within the
symbols `<>` and `</>`

The above code example using a React fragment instead of a div would look like
this:

```jsx
<>
  <h1>Welcome to JSX</h1>
  <p>Please do enjoy your stay</p>
</>
```

Using this component will allow you to render the insides of the fragment
without wrapping them in a container element that modifies your HTML tree.

The transpiled JavaScript code now looks like this:

```jsx
const WelcomeComponent = () => {
  return React.createElement(
    React.Fragment,
    null,
    React.createElement("h1", null, "Welcome to JSX"),
    React.createElement("p", null, "Please do enjoy your stay")
  );
};
```

As shown in the transpiled code above, `<>` is just a replacement for
`React.Fragment`. You can write the same JSX example above in it's long-form
like this:

```jsx
<React.Fragment>
  <h1>Welcome to JSX</h1>
  <p>Please do enjoy your stay</p>
</React.Fragment>
```

We can now add props to this fragment, the use of which will be explained in a
few chapters.

Do note that if you already have a root element, wrapping it inside a fragment
as shown below is redundant:

```jsx
<>
  <div className="flex">
    <p>P1</p>
    <p>P2</p>
  </div>
</>
```
