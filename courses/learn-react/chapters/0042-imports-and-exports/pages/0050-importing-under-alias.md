If you have a conflict between a third-party import and your component name, then you could use an alias to import the third-party entity.

Consider a `Pane` component like this:

```jsx
{/* Pane.jsx */}
// Broken code
import { Pane } from "neetoui";

const Pane = () => {
  // rest of the component
};
```

Having a `Pane` from the `neetoUI` package and a custom `Pane` will lead to a conflict.

To solve such a situation we can import the third-party entities under an alias using the `as` keyword as shown:

```jsx
{/* Pane.jsx */}
// Correct code
import { Pane as NeetoUIPane } from "neetoui";

const Pane = () => {
  // rest of the component
};
```

When naming the alias, do compose it from the library name. In the above example, since `Pane` was from the `NeetoUI` library, we gave `Pane` the alias of `NeetoUIPane`.

Here's another example:

```jsx
import { Card as NeetoUICard, Table } from "neetoui";
import { Card as AntdCard } from "antd";

const Card = () => {
  // rest of the component
};
```

We have not used the alias for `Table` in the above example as it has no conflicts. We should prefer to use the alias name only in case of conflict of the same names.
