Let's see how we can pass numeric values as `prop`.

In the below example, the `Fahrenheit` component receives a numeric prop `celsius` and displays the corresponding Fahrenheit value.

<codeblock language="reactjs" type="lesson">
<code>
const Fahrenheit = ({ celsius }) => {
  const fahrenheit = (celsius * 9) / 5 + 32;

  return (
    <p>
      {celsius}°C is equal to {fahrenheit}°F
    </p>
  );
};

const App = () => (
  <div>
    <h1>Celsius to Fahrenheit converter</h1>
    <Fahrenheit celsius={100} />
  </div>
);

export default App;
</code>
</codeblock>

In the above code snippet, we have passed the `celsius` value inside curly braces `celsius={100}`.

We can also pass `celsius` value as a string like this:

```jsx
<Fahrenheit celsius="100" />
```

This is possible because of type coercion in JavaScript. [Type coercion](https://developer.mozilla.org/en-US/docs/Glossary/Type_coercion) is the automatic conversion of values from one data type to another.

However, passing a numeric value as a string is error-prone due to the inconsistencies in how values are converted between different data types in JavaScript.

For example: "100" * 2 would result in 200, but "100" + 100 would result in "100100". The multiplication operator converts a string to a number, and the addition operator converts a number to a string if one of the arguments is a string and the other is a number.
