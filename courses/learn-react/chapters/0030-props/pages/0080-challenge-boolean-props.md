Enable the `ToggleButton` by setting `isEnabled` to true.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const ToggleButton = ({ isEnabled }) => (
  <button disabled={!isEnabled}>{isEnabled ? "Enabled" : "Disabled"}</button>
);

const App = () => <ToggleButton isEnabled={false} />;

export default App;
</code>
<solution>
const ToggleButton = ({ isEnabled }) => (
  <button disabled={!isEnabled}>
    {isEnabled ? "Enabled" : "Disabled"}
  </button>
);

const App = () => <ToggleButton isEnabled />;

export default App;
</solution>
</codeblock>
