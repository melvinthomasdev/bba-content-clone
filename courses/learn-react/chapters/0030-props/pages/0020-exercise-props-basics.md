Define a component `MyHobby` and use it inside the App component. `MyHobby` should display the text `My Hobby is coding` when we pass `"coding"` to the `hobby` attribute.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Introduction = ({ name }) => <h1>My name is {name}.</h1>;

const App = () => (
  <div>
    <h1>Hello 👋</h1>
    <Introduction name="John Doe" />
    Replace this line with your component JSX
  </div>
);

export default App;
</code>
<solution>
const MyHobby = ({ hobby }) =>
  <h1>My hobby is {hobby}.</h1>;

const Introduction = ({ name }) =>
  <h1>My name is {name}.</h1>;

const App = () => (
  <div>
    <h1>Hello 👋</h1>
    <Introduction name="John Doe" />
    <MyHobby hobby="coding" />
  </div>
);

export default App;
</solution>
</codeblock>
