When destructuring, we can assign default values to `props`.

In the `Settings` component below, we have assigned the default values `light` and `English` for `theme` and `language`, respectively.

```jsx
const Settings = ({ theme="light", language="English", isNotificationEnabled  }) => (
  // Component logic
);
```

If we skip the `theme` or `language` prop, their default values will be used inside the `Settings` component.

For example, calling the `Settings` as given below will override the theme to `dark`, whereas language will be defaulted to `English`.

```jsx
<Settings isNotificationEnabled theme="dark" />;

/* Settings component receives the prop values:
isNotificationEnabled: true
language: "English"
theme: "dark"
*/
```

The default value is only used if the prop is not passed or set to `undefined`. In all other cases, it will not use the default prop value.

Here are some examples demonstrating the same:

```js
<Settings /> // language is defaulted to "English"
<Settings language={undefined} /> // language is defaulted to "English"
<Settings language="Spanish" /> // language is Spanish
<Settings language={null} /> // language is null
<Settings language="" /> // language is empty string
<Settings language /> // language is true
```

## Renaming props

It is also possible to rename `props` while destructuring them.

For example, we can rename the `theme` prop of the `Setting` component as `appearance`:

```js
const Settings = ({ theme: appearance }) => (
  <p>{appearance}</p>
  // component logic
);

<Settings theme="light" />;
```

You can even combine defaulting and renaming in a single attribute like so:

```jsx
const Settings = ({ theme: appearance = "light" }) => (
  <p>{appearance}</p>
  // component logic
);
```
