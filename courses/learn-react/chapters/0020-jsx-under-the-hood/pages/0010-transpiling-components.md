JSX or "JavaScript Syntax eXtension" as shown earlier is an extension that
allows us to describe React's object tree in a way that resembles the HTML
template.

But it is important to remember that under that syntactic sugar, it is just
plain old JavaScript. As far as the browser is concerned, JSX doesn't even
exist.

Under the hood, your JSX is translated to JavaScript in a method called
"transpiling" so that browsers never have to know that JSX was even present in
the original code.

Take this trivial example of a `HelloWorld` component:

```jsx
import React from "react";

const HelloWorld = () => {
  return <h1>Hello World!</h1>;
};
```

The code above is transpiled by a transpiler such as [Babel](https://babeljs.io)
or [TypeScript](https://www.typescriptlang.org) into JavaScript as shown below:

```jsx
import React from "react";

const HelloWorld = () => {
  return React.createElement("h1", null, "Hello World!");
  //Syntax: React.createElement(type, [props], [...children])
};
```

And `React.createElement(...)` in turn just returns a simple JavaScript object
that looks like this:

```js
const HelloWorld = () => {
  return {
    type: "h1"
    props: {children: "Hello World"},
    $$typeof: Symbol(react.element),
    key: null,
    ref: null,
  }
}
```

The object shown in the example above is what React uses to create the HTML DOM
object that we see as the UI.

You can verify this by yourself by logging the outputs of the hello world
components shown above into the console as shown:

```jsx
import React from "react";

console.log(<div>Hello World</div>);

console.log(React.createElement("div", null, "Hello World"));

// Both of the above should give identical outputs
```

This is also why we need to add the `import React from 'react'` line even though
we use functional components that don't seem to use `React` on the surface.
