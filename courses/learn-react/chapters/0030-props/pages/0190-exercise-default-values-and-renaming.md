In this exercise, your task is to reassign the `age` attribute to `userAge` and also set the default value of `Guest` for the `username` and `25` for `userAge`.

<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const App = ({ username, age }) => (
  <div>
    <h2>User Profile</h2>
    <p>
      Username: {username}
      <br />
      Age: {age}
    </p>
  </div>
);

export default App;
</code>
<solution>
const App = ({ username = "Guest", age: userAge = 25 }) => (
  <div>
    <h2>User Profile</h2>
    <p>
      Username: {username}
      <br />
      Age: {userAge}
    </p>
  </div>
);

export default App;
</solution>
</codeblock>
