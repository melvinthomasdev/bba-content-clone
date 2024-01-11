We may frequently need to filter and display a subset of data based on a specific condition.

Let's see an example to understand this concept. Suppose we have users' data with fields such as `name`, `email`, `isActive`, and `profileUrl`. Here the `isActive` field represents the status of the user, where `true` means the user is currently active, and `false` means the user is not active at the moment.

Our goal is to display a list of users who are currently active. In this case, we can use JavaScript’s [filter()](https://courses.bigbinaryacademy.com/learn-intermediate-javascript/advanced-array-methods/filter/) method to filter out the active users, and then we can use the [map()](https://courses.bigbinaryacademy.com/learn-basic-javascript/navigate-through-array/map/) method to render the list of active users.

Step 1. Create a new array that contains only active users:

```jsx
const activeUsers = USERS.filter(user => user.isActive);
```

Here the `filter` method iterates through each object of the `USERS` array and includes the `user` object in the `activeUsers` array only if the `isActive` field is set to `true`.

Step 2. Map over the `activeUsers` array to generate JSX nodes:
```jsx
activeUsers.map(user => (
  <User
    name={user.name}
    email={user.email}
    profileUrl={user.profileUrl}
  />
))
```

Step 3. Return the mapped array of JSX nodes from the `App` component:
<codeblock language="reactjs" type="lesson">
<code>
const USERS = [
  {
    name: "Sid Anderson",
    email: "sid@example.com",
    isActive: true,
    profileUrl: "https://i.pravatar.cc/150?img=12",
  },
  {
    name: "Ava Park",
    email: "ava@example.com",
    isActive: true,
    profileUrl: "https://i.pravatar.cc/150?img=5",
  },
  {
    name: "Liam Park",
    email: "liam@email.com",
    isActive: true,
    profileUrl: "https://i.pravatar.cc/150?img=14",
  },
  {
    name: "Max Wilson",
    email: "max@email.com",
    isActive: false,
    profileUrl: "https://i.pravatar.cc/150?img=17",
  },
];

const App = () => {
  const activeUsers = USERS.filter(user => user.isActive);

  return (
    <div style={{ display: "flex" }}>
      {activeUsers.map(user => (
        <User {...user} />
      ))}
    </div>
  );
};

const User = ({ name, email, profileUrl }) => (
  <div
    style={{
      border: "1px solid black",
      width: 150,
      margin: 5,
      overflowWrap: "anywhere",
    }}
  >
    <img alt={name} src={profileUrl} />
    <div style={{ padding: 5 }}>
      <strong>{name}</strong>
      <p>{email}</p>
    </div>
  </div>
);

export default App;
</code>
</codeblock>
