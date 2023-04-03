While the example shown on the last page looks reasonable enough to read, let's
try translating a nested component to see how the translation changes:

```jsx
import React from "react";

const HelloWorld = () => (
  <div>
    <h1>Hello World!</h1>
    <ul>
      <li>This is a line.</li>
      <li>This is another line.</li>
    </ul>
  </div>
);
```

This nested component above is translated to:

```jsx
import React from "react";

const HelloWorld = () =>
  React.createElement(
    "div",
    null,
    React.createElement("h1", null, "Hello World!"),
    React.createElement(
      "ul",
      null,
      React.createElement("li", null, "This is a line."),
      React.createElement("li", null, "This is another line.")
    )
  );
```

You should be able to see how trying to write React without JSX can get
downright unreadable with even the slightest amount of nesting or complexity.

This is why using JSX, while not mandatory, makes writing React a lot easier.
