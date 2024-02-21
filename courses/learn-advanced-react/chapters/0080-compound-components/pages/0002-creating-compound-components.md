Suppose we want to build a custom select component with identical behaviour,
thus it contains a list of options and only one option can be selected at once.
The regular way of going about it would be like this:

```jsx
import React from "react";

const Option = ({ children, onClick, active }) => {
  return (
    <div
      style={{ backgroundColor: active ? "grey" : "white" }}
      onClick={onClick}
    >
      <p>{children}</p>
    </div>
  );
};

const Select = ({ options }) => {
  const [activeOption, setActiveOption] = useState("");

  return options.map(({ key, value }) => (
    <Option
      key={key}
      active={activeOption === key}
      onClick={() => setActiveOption(value)}
    >
      {key}
    </Option>
  ));
};

const App = () => (
  <Select
    options={[
      { key: "Oliver", value: "oliver" },
      { key: "Eve", value: "eve" },
    ]}
  />
);

export default App;
```

While the code above works just fine, a few issues we need to address are:

- Ideally, props shouldn't have to pass through so many components and the `App`
  component shouldn't have any knowledge about the options.
- Since the `Option` component was specifically built for the `Select`
  component, there's no point in being able to use them independently of each
  other.
- Any changes between `Option` components either have to be applied to all
  `Select` components or new props need to be added to the `Select` component to
  accommodate for it.

We can address these issues by converting the above `Select` and `Option`
components into a compound component like this:

```jsx
import React, { useState, useContext } from "react";

const SelectContext = React.createContext();

const Select = ({ children }) => {
  const [activeOption, setActiveOption] = useState("");

  return (
    <SelectContext.Provider value={{ activeOption, setActiveOption }}>
      {children}
    </SelectContext.Provider>
  );
};

const Option = ({ key, children }) => {
  const { activeOption, setActiveOption } = useContext(SelectContext);

  if (!activeOption || !setActiveOption) {
    throw new Error(
      "Context is undefined. Option should be used within the scope of a Select component."
    );
    return (
      <p>
        Error: Option should be used within the scope of a Select component!
      </p>
    );
  }

  const active = activeOption === key;

  return (
    <div
      style={{ backgroundColor: active ? "grey" : "white" }}
      onClick={() => setActiveOption(key)}
    >
      <p>{children}</p>
    </div>
  );
};

Select.Option = Option;

const App = () => (
  <Select>
    <Select.Option key="oliver">Oliver</Select.Option>
    <Select.Option key="eve">Eve</Select.Option>
  </Select>
);

export default App;
```

In the above code, the `Select` component is a compound component built using
`Option` components. Because we have coupled the `Option` component with the
`Select` component using `Select.Option = Option`, we only need to import the
`Select` component and it will include the `Option` component as well.

With the reworked code, we address the issues mentioned previously:

- We avoid prop drilling by moving props that `Option` needs straight to the
  `Option` component using Context API. The state and behaviour are managed by
  the `Select` component and not exposed outside it.
- The `Options` component is only ever used within the scope of the `Select`
  component. Using it outside the scope will throw an error.
- The component is structured like HTML and if you wished to add a line break
  between any two `Options`, you don't have to add a prop or make the change
  global across all `Select` components.

As you can see, compound components are a great choice when the child components
are exclusively used inside the scope of the parent component and you need to
share state and behaviour amongst them. It makes your code easier to maintain
and debug in the long run.

However, in the short run, this pattern isn't always the best solution since it
is more complex and does take more time to build.

If you wish to learn more about compound components, check out
[this article on compound components by Kent C Dodds](https://kentcdodds.com/blog/compound-components-with-react-hooks/)
