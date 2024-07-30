Compound components are a design pattern in React, where components are used together to accomplish a specific task. These components share an internal state to communicate with each other. Typically, a parent component manages the state and behaviour, while child components encapsulate the presentation and functionality of specific parts of the overall component.

Think of it like the `<select>` and `<option>` tags in HTML:

```html
<select name="userStatus">
  <option value="active">Active</option>
  <option value="afk">Away from keyboard</option>
  <option value="meeting">In a meeting</option>
  <option value="inactive">Inactive</option>
</select>
```

The `select` tag works together with the `option` tag which is used for a drop-down menu to select items in HTML. Here the `select` element manages the state, and we see what elements are passed as options to the `select`. This communication between the parent and child is what defines a compound component. Compound components in React are used to build a declarative UI component which helps to avoid prop drilling.

### Creating Compound Components

Suppose we want to build a custom select component with identical behavior, thus it contains a list of options and only one option can be selected at once.

Let's see, how we can implement this without using compound components:

```jsx
import React, { useState } from "react";

const Option = ({ children, onClick, active }) => {
  return (
    <div
      style={{ backgroundColor: active ? "grey" : "white", cursor: "pointer" }}
      onClick={onClick}
    >
      <p>{children}</p>
    </div>
  );
};

const Select = ({ options }) => {
  const [activeOption, setActiveOption] = useState("");

  return options.map(({ label, value }) => (
    <Option
      key={value}
      active={activeOption === value}
      onClick={() => setActiveOption(value)}
    >
      {label}
    </Option>
  ));
};

const App = () => (
  <Select
    options={[
      { label: "Oliver", value: "oliver" },
      { label: "Eve", value: "eve" },
    ]}
  />
);

export default App;
```

The current implementation tightly couples the `Option` component with the `Select` component. If you want to customize or add functionality to individual options, you will need to expose customization props through the parent component `Select`. This violates the principle of separation of concerns and makes the code less reusable and maintainable.

We can address these issues by converting the above `Select` and `Option` components into a compound component.

First, let’s modify the `Select` component. This component maintains the `activeOption` state, which is then passed down to all the child components through the `SelectContext.Provider`.

```jsx
const SelectContext = React.createContext();

const Select = ({ children }) => {
  const [activeOption, setActiveOption] = useState("");

  return (
    <SelectContext.Provider value={{ activeOption, setActiveOption }}>
      {children}
    </SelectContext.Provider>
  );
};
```

To give the `Option` component access to the SelectContext provider, we need to render it as a child of the `Select` component. Now, we will modify the `Options` component to receive the `activeOption` state and `setActiveOption` function from the context. Upon clicking an option, we will update the `activeOption` state with the current value.

Also, we will make the `Option` component a property of the `Select` component. This way, we won't need to explicitly import the `Option` component whenever we want to use the `Select` component in any file. Instead, we'll only need to import `Select`.

```jsx
const Option = ({ value, children }) => {
  const { activeOption, setActiveOption } = useContext(SelectContext);

  const active = activeOption === value;

  return (
    <div
      style={{ backgroundColor: active ? "grey" : "white", cursor: "pointer" }}
      onClick={() => setActiveOption(value)}
    >
      <p>{children}</p>
    </div>
  );
};

Select.Option = Option;
```

Now we can use `Option` as the property of the `Select` component. Let's use the `Select` component to render two items using the `Select.Option` component:

```jsx
const App = () => (
  <Select>
    <Select.Option value="oliver">Oliver</Select.Option>
    <Select.Option value="eve">Eve</Select.Option>
  </Select>
);

export default App;
```

### Benefits of compound components

Compound components manage their own internal state, which they share among the several child components. When implementing a compound component, we don’t have to worry about managing the state ourselves. The components API gives you a nice way to express relationships between components.

Furthermore, when importing a compound component, we don’t have to explicitly import the child components that are available on that component.
