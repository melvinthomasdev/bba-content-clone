In this challenge, your task is to rename the `age` attribute to `userAge` and set the default value of `username` to `Guest` and default value of `userAge` to `25`.

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
