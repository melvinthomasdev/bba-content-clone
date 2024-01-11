Add a prop to the `Speedometer` to indicate whether the current speed exceeds the maximum speed limit. Based on this prop, the `Speedometer` component should display the appropriate message. Complete the code to show the correct message.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const SpeedoMeter = () => (
  <strong>
    {false
      ? "Slow down!!! You're exceeding the speed limit"
      : "You're within the speed limit. Drive safely"}
  </strong>
);

const App = () => {
  const currentSpeed = 90;
  const maximumLimit = 45;

  return (
    <div>
      <p>Speed limit: {maximumLimit}</p>
      <p>Current speed: {currentSpeed}</p>
      <SpeedoMeter />
    </div>
  );
};

export default App;
</code>
<solution>
const SpeedoMeter = ({ isExceedingLimit }) => (
  <strong>
    {isExceedingLimit
      ? "Slow down!!! You're exceeding the speed limit"
      : "You're within the speed limit. Drive safely"}
  </strong>
);

const App = () => {
  const currentSpeed = 90;
  const maximumLimit = 45;

  const isExceedingLimit = currentSpeed > maximumLimit;

  return (
    <div>
      <p>Speed limit: {maximumLimit}</p>
      <p>Current speed: {currentSpeed}</p>
      <SpeedoMeter isExceedingLimit={isExceedingLimit} />
    </div>
  );
};

export default App;
</solution>
</codeblock>
