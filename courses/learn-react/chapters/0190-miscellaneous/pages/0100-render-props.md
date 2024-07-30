Render props is a design pattern in React used for sharing code between components using a prop whose value is a function. Instead of implementing its render logic, a child component receives render props as a function and invokes it.

One of the main reasons for using render props in React is to reuse component logic. By encapsulating behavior within a component, render props allow you to share and reuse this logic across multiple components, keeping your code DRY and maintainable.

### Usage of render props

Consider a scenario where we have a component called `Title`. In this case, the `Title` component shouldn’t do anything besides rendering the value we pass. We can use a `render` prop for this. Let’s pass the value we want the `Title` component to render to the `render` prop.

```jsx
<Title render={() => <h1>Hello world</h1>} />
```

We can render this data within the `Title` component by invoking the render prop.

```jsx
const Title = props => props.render();
```

Let's take an example where a user can enter an amount in Indian currency, which will then be converted to USD and EUR.

First, see this implementation without using render props.

<codeblock language="reactjs" packages="tailwindcss" type="lesson">
<code>
import React, { useState } from "react";

const DollarConverter = ({ amount = 0 }) => {
  const convert = () => (amount * 0.012).toFixed(2);

  return (
    <div>
      <div>USD: {convert()} $</div>
    </div>
  );
};

const EuroConverter = ({ amount = 0 }) => {
  const convert = () => (amount * 0.011).toFixed(2);

  return (
    <div>
      <div>EUR: {convert()} €</div>
    </div>
  );
};

const Input = ({ amount, handleChange }) => {
  return (
    <input
      type="number"
      value={amount}
      onChange={e => handleChange(e.target.value)}
      placeholder="Amount in INR"
      className="mb-4 w-full rounded-md border-2 border-gray-300 p-2 "
    />
  );
};

const App = () => {
  const [amount, setAmount] = useState(0);

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-100">
      <div className="rounded bg-white p-8 shadow-md">
        <h1 className="mb-4 text-2xl font-bold">Currency Converter 💵</h1>
        <Input amount={amount} handleChange={setAmount} />
        <DollarConverter amount={amount} />
        <EuroConverter amount={amount} />
      </div>
    </div>
  );
};

export default App;
</code>
</codeblock>

Although this is a valid solution, it might not scale well for larger applications with components that handle many children. Every time the state changes, it could cause a re-render of all the children, even the ones that don’t handle the data, which could negatively affect the performance of your app.

Let's see how we can handle this problem using render props. For that first let’s modify the `Input` component in a way that it can receive render props, while also abstracting the state management to this component. This gives the parent component control over how to render.

```jsx
const Input = props => {
  const [amount, setAmount] = useState(0);

  return (
    <>
      <input
        type="number"
        value={amount}
        onChange={e => setAmount(e.target.value)}
        placeholder="Amount in INR"
        className="mb-4 w-full rounded-md border-2 border-gray-300 p-2 "
      />
      {props.render(amount)}
    </>
  );
};
```

Next, modify the `App` component for the `DollarConverter` and `EuroConverter` components to access the value of the input. We'll achieve this by rendering those components as a child of `Input`, allowing them to receive the current value directly.

```jsx
const App = () => {
  return (
    {/* rest of the code */}
    <Input
      render={value => (
        <>
          <DollarConverter amount={value} />
          <EuroConverter amount={value} />
        </>
      )}
    />
  );
};
```

This is what the entire code looks like:

<codeblock language="reactjs" packages="tailwindcss" type="lesson">
<code>
import React, { useState } from "react";

const DollarConverter = ({ amount = 0 }) => {
  const convert = () => (amount * 0.012).toFixed(2);

  return (
    <div>
      <div>USD: {convert()} $</div>
    </div>
  );
};

const EuroConverter = ({ amount = 0 }) => {
  const convert = () => (amount * 0.011).toFixed(2);

  return (
    <div>
      <div>EUR: {convert()} €</div>
    </div>
  );
};

const Input = props => {
  const [amount, setAmount] = useState(0);

  return (
    <>
      <input
        type="number"
        value={amount}
        onChange={e => setAmount(e.target.value)}
        placeholder="Amount in INR"
        className="mb-4 w-full rounded-md border-2 border-gray-300 p-2 "
      />
      {props.render(amount)}
    </>
  );
};

const App = () => {
  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-100">
      <div className="rounded bg-white p-8 shadow-md">
        <h1 className="mb-4 text-2xl font-bold">Currency Converter 💵</h1>
        <Input
          render={value => (
            <>
              <DollarConverter amount={value} />
              <EuroConverter amount={value} />
            </>
          )}
        />
      </div>
    </div>
  );
};

export default App;
</code>
</codeblock>
