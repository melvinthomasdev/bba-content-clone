If you need to pass down a boolean value to a component through a prop, you can
pass the attribute name alone if its value is true or skip it if the value it
contains is false.

Take this example of a table that has 3 props of which 2 are Boolean:

```jsx
<ProfilePicture required={false} loading={true} name="Oliver" />
```

In the above example, since `required` is false, you can simply omit it to set
`required` to `undefined` rather than explicitly set `required={false}`. But do
beware that the value of `undefined` is not suitable for all cases.

Similarly, the value of the `loading` prop is true. You can simply mention
`loading` rather than pass `loading={true}`.

Using this technique also referred to as "implicit declaration of props", we can
refactor the above example like this:

```jsx
<ProfilePicture loading name="Oliver" />
```

Keeping the implicitly `true` attributes as the first of the props being passed
down gives a better visual hierarchy.
