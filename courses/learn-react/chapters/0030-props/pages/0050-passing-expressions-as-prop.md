We can pass any valid JavaScript expression as a prop.

In the below example, the `BatteryStatus` component has a prop `isLow`, which expects a boolean value. From the `App` component, we have passed a boolean expression `currentPercentage < minimum` to this prop.

<codeblock language="reactjs" type="lesson">
<code>
const BatteryStatus = ({ isLow }) => (
  <h1>{isLow ? "Battery low 🪫" : "Battery full 🔋"}</h1>
);

const App = () => {
  const currentPercentage = 10;
  const minimum = 20;

  return <BatteryStatus isLow={currentPercentage < minimum} />;
};

export default App;
</code>
</codeblock>
