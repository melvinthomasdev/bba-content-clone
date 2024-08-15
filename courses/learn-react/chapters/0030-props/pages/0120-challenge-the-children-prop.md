Update the card component to display its children.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Card = () => (
  <div style={{ padding: 40, backgroundColor: "yellowgreen" }}>
    Hint: Display children of Card component here.
  </div>
);

const App = () => (
  <Card>
    <h1>Contact</h1>
    <p>Email: oliver@example.com</p>
  </Card>
);

export default App;
</code>
<solution>
const Card = ({ children }) => (
  <div style={{ padding: 40, backgroundColor: "yellowgreen" }}>
    {children}
  </div>
);

const App = () => (
  <Card>
    <h1>Contact</h1>
    <p>Email: oliver@example.com</p>
  </Card>
);

export default App;
</solution>
</codeblock>
