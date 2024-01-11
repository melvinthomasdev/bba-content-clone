We can pass spread props along with regular props in React:

```js
<User {...admin} role="Administrator" />
// OR
<User role="Administrator" {...admin} />
```

We can even spread multiple objects while passing props to a component:

```js
<User {...standardUser}  {...admin} />
<User {...standardUser}  {...admin} id={admin.userId} />
<User {...standardUser}  id={admin.userId}  {...admin} />
```

However, it is necessary to understand that if multiple values are provided for the same prop, the component will get the value specified last.

To illustrate this concept, let's consider an example with a `Settings` component that accepts the following props:

- `theme` (either "dark" or "light")
- `language`
- `isNotificationEnabled`

We have two objects: `defaultSettings` and `userSettings`.

```jsx
const defaultSettings = {
  theme: "light",
  language: "English",
};

const userSettings = {
  theme: "dark",
  isNotificationEnabled: true,
};
```

We can use these objects to pass props to the `Settings` component. Now, let's examine different scenarios to understand how the ordering of props affects the values:

1. When we pass only `defaultSettings` using spread syntax:

    ```jsx
    <Settings {...defaultSettings} />

    /*
    Received props in Settings component:
    theme: "light"
    language: "English"
    isNotificationEnabled: undefined
    */
    ```

2. When we pass `defaultSettings` using spread syntax, but also explicitly set `theme` to "dark":

    ```jsx
    <Settings {...defaultSettings} theme="dark" />

    /*
    Received props in Settings component:
    theme: "dark"
    language: "English"
    isNotificationEnabled: undefined
    */
    ```

3. When we pass `defaultSettings` using spread syntax, and then pass `userSettings` using spread syntax:

    ```jsx
    <Settings {...defaultSettings} {...userSettings} />

    /*
    Received props in Settings component:
    theme: "dark"
    language: "English"
    isNotificationEnabled: true
    */
    ```

4. When we explicitly set `theme` to "light", `language` to "spanish", and then pass `userSettings` using spread syntax:

    ```jsx
    <Settings theme="light" language="Spanish" {...userSettings} />

    /*
    Received props in Settings component:
    theme: "dark"
    language: "Spanish"
    isNotificationEnabled: true
    */
    ```

By changing the ordering of props, we can control the values of props received by the component and ensure the desired behavior.
