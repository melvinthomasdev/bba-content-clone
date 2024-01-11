It is a common requirement to display the same UI element for different sets of data. For example, social media posts, lists of users, product lists on an e-commerce website, and so on.

Let's see a simple implementation of displaying a list of users.

<codeblock language="reactjs" type="lesson">
<code>
const App = () => (
  <div style={{ display: "flex" }}>
    <User
      name="Sid Anderson"
      email="sid@example.com"
      profileUrl="https://i.pravatar.cc/150?img=12"
    />
    <User
      name="Ava Park"
      email="ava@example.com"
      profileUrl="https://i.pravatar.cc/150?img=5"
    />
    <User
      name="Liam Park"
      email="liam@email.com"
      profileUrl="https://i.pravatar.cc/150?img=14"
    />
    <User
      name="Max Wilson"
      email="max@email.com"
      profileUrl="https://i.pravatar.cc/150?img=17"
    />
  </div>
);

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

In the above example, we can see that the same component, i.e., User, is being used for different data.

In most real-life cases, we will have to render components dynamically from an array of data received from APIs. In such cases, we can use the `map` method from JavaScript to generate an array of elements from the data.

Let us try to simulate such a situation by extracting the data into a constant in the above example and then applying `map` to it.

Step 1. Move the data into an array of objects:

```jsx
export const USERS = [
  {
    name: "Sid Anderson",
    email: "sid@example.com",
    profileUrl: "https://i.pravatar.cc/150?img=12",
  },
  {
    name: "Ava Park",
    email: "ava@example.com",
    profileUrl: "https://i.pravatar.cc/150?img=5",
  },
  {
    name: "Liam Park",
    email: "liam@email.com",
    profileUrl: "https://i.pravatar.cc/150?img=14",
  },
  {
    name: "Max Wilson",
    email: "max@email.com",
    profileUrl: "https://i.pravatar.cc/150?img=17",
  },
];
```

Step 2. Map the records of `USERS` array into a new array of JSX nodes:

```jsx
USERS.map(user => (
  <User
    name={user.name}
    email={user.email}
    profileUrl={user.profileUrl}
  />
))
```

For each `user` object, a JSX element is created, and the resulting array contains a list of JSX nodes of `User` component that can be rendered in a React component to display the list of users.

Step 3. Return the mapped array of JSX nodes from the `App` component.

<codeblock language="reactjs" type="lesson">
<code>
const USERS = [
  {
    name: "Sid Anderson",
    email: "sid@example.com",
    profileUrl: "https://i.pravatar.cc/150?img=12",
  },
  {
    name: "Ava Park",
    email: "ava@example.com",
    profileUrl: "https://i.pravatar.cc/150?img=5",
  },
  {
    name: "Liam Park",
    email: "liam@email.com",
    profileUrl: "https://i.pravatar.cc/150?img=14",
  },
  {
    name: "Max Wilson",
    email: "max@email.com",
    profileUrl: "https://i.pravatar.cc/150?img=17",
  },
];

const App = () => (
  <div style={{ display: "flex" }}>
    {USERS.map(user => (
      <User {...user} />
    ))}
  </div>
);

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
