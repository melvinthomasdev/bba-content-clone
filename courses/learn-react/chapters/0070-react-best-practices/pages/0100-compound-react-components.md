A compound component refers to a React development pattern wherein the state and
behaviours of multiple components are grouped together inside a component.

In other words, when multiple components work together to have a shared state
and handle logic together, they are called compound components.

Let us understand this with the help of an example. Suppose we want to build a
custom select component which contains a list of options and one option can be
selected at once, then we can create something like this:

```jsx
const Option = ({ children, onClick, active }) => {
  return (
    <div
      style={
        active ? { backgroundColor: "grey" } : { backgroundColor: "white" }
      }
      onClick={onClick}
    >
      <p>{children}</p>
    </div>
  );
};

const Select = ({ options }) => {
  const [selectedOption, setSelectedOption] = useState(null);

  return options.map(({ key, value }) => (
    <Option
      active={selectedOption === key}
      onClick={() => setSelectedOption(value)}
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
```

The above code will get the job done but there are some issues that we need to
address here. These issues are as follows:

- `Select` and `Option` are two separate components in the sense that `Option`
  can be used without a `Select` component which doesn't make sense because
  options should be a part of the select menu.

- Another issue is prop drilling. Props are passed through multiple levels.
  Ideally, the `App` component should not have any knowledge about the options.
  Option state and behaviour should be handled by the `Select` component.

- It is not the best approach if we have knowledge of the options beforehand.
  Also, if we need a line break after certain options then we will need another
  prop to do so.

Now that we know the issues, we can jot down the requirements before attempting
to fix above code:

- Options should only be used within the scope of a select menu.
- Avoid prop drilling. State and behaviour should be managed by the `Select`
  component.
- Should be good for static options.

One way to fix the above code is using the React context API like this:

```jsx
import React, { useState, useContext } from "react";

const SelectContext = React.createContext();

const Select = ({ children }) => {
  const [activeOption, setActiveOption] = useState(null);

  return (
    <SelectContext.Provider value={{ activeOption, setActiveOption }}>
      {children}
    </SelectContext.Provider>
  );
};

const Option = ({ key, children }) => {
  const { activeOption, setActiveOption } = useContext(DropDownContext);

  if (!activeOption || !setActiveOption) {
    throw new Error(
      "Context is undefined. Option should be used within the scope of a Select component!!"
    );
    return (
      <p>Option should be used within the scope of a Select component!!</p>
    );
  }

  return (
    <div
      style={
        activeOption === key
          ? { backgroundColor: "grey" }
          : { backgroundColor: "white" }
      }
      onClick={() => setActiveOption(key)}
    >
      <p>{children}</p>
    </div>
  );
};

Select.Option = Option;

export default function App() {
  return (
    <Select>
      <Select.Option key="oliver">Oliver</Select.Option>
      <Select.Option key="eve">Eve</Select.Option>
    </Select>
  );
}
```

In the above code, the `Select` component is a compound component. It is built
up by multiple components which share state and behaviour. Because we have
coupled the `Option` component with the `Select` component using
`Select.Option = Option`, we only need to import the `Select` component and it
will include the `Options` component as well.

If we render the `Option` component outside of the `Select` component then an
error will be thrown because the context will be `undefined` in that case.

It also solves the issue of prop-drilling for us. Now that state and behaviour
are managed by the `Select` component and the state is not exposed outside of
thee `Select` component.

Another advantage is that the component stacking looks like HTML which makes the
code more readable and if you wish to add a line-break after any options then
you can do so without passing a prop.

You shouldn't always go for compound components though. Compound components are
a good choice when the child components need to be inside the scope of the
parent component and there is a need to share state and behaviour amongst them.

They also make a good choice when we need to render a UI based on static data
which is know beforehand.
