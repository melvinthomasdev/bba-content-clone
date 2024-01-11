The JavaScript rest destructuring can also be applied to React props. Let's go through an example that demonstrates the usage of rest props.

In the below example, we have a `Button` component that returns a button of fixed width and height. The Button component accepts a regular prop named `label` and a rest prop named `styleProps`. Here, the `styleProps` collects all the attributes passed to the `Button` component other than the `label`.

<codeblock language="reactjs" type="lesson">
<code>
const Button = ({ label, ...styleProps }) => (
  <button
    style={{
      ...styleProps,
      width: 100,
      height: 30,
      display: "block",
      marginBottom: 20,
    }}
  >
    {label}
  </button>
);

const App = () => (
  <div>
    <Button label="Cancel" />
    <Button
      backgroundColor="lightgreen"
      borderRadius={15}
      borderWidth={0}
      label="Submit"
    />
    <Button
      backgroundColor="red"
      borderWidth={0}
      color="white"
      label="Delete"
    />
  </div>
);

export default App;
</code>
</codeblock>

While props spreading and rest props can keep the number of props in a readable size, they also have some potential drawbacks. They can lead to passing unnecessary props to components that don't require those props or passing invalid HTML attributes to the DOM. Therefore, we recommended using this syntax sparingly.
