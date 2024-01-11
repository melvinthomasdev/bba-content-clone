Consider a `User` component which displays the details of a user. It receives two props, `name` and `email`.

We have another component say, `Organization`, which has the administrator details of the organization:

```jsx
const admin = { name: "John Doe", email: "john@example.com" };
```

We need to display the administrator details inside the `Organization` component.

We can achieve this requirement by passing the `admin` details to the `User` component like this:

```jsx
const Organization = () => {
  const admin = { name: "John Doe", email: "john@example.com" };

  return <User email={admin.email} name={admin.name} />;
};
```

Here we have passed the properties of `admin` to the `User` component one by one:

```jsx
<User name={admin.name} email={admin.email}/>
```

What if the `User` component had a long list of props like `name`, `email`, `age`, `gender` and so on?

It would be tiring to list the props one by one.

To solve this issue, JSX allows us to copy the object properties to the props of a component by using the ES6 spread operator:

```jsx
<User {...admin} />;

// Equivalent to <User email={admin.email} name={admin.name}/>
```

Here is another case where we can utilize the above spread syntax to avoid code repetition:

```jsx
const Organization = () => {
  const name = "Oliver";
  const email = "oliver@example.com";
  const organization = "Ace";
  const role = "Admin";

  return (
    <User email={email} name={name} organization={organization} role={role} />
  );
};
```

In this example, we are passing each variable name to the prop. Instead of repeating the prop name and variable name, we can pass the variables by spreading an object like this:

```jsx
<User {...{ email, name, organization, role }} />;
```

At Bigbinary, we follow this approach to increase code readability.

One thing to note here is that the object properties and prop names should be the same to pass it using the spread operator.

If the prop name and variable name are different, we need to add them separately to the props list:

```jsx
// Example 1
<User {...{ email, name, organization }} currentRole={role} />;

// Example 2
const admin = {
  name: "John Doe",
  personalEmail: "john@example.com",
  workEmail: "john@official.com",
};
<User {...admin} email={admin.workEmail} />;
```
