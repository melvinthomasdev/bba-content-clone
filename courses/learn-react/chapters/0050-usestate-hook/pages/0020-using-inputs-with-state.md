In React, input fields are almost always controlled by a state object like so:

```jsx
{/* NameInputField.jsx */}
const NameInputField = () => {
  const [name, setName] = useState("")
  return (
    <>
      <label>
        User Name:
        <input
          value={name}
          onChange={e => setName(e.target.value)}
        />
      </label>
      <button onClick={() => alert(name)}>
        Display Name
      </button>
    </>
  )
}
```

In the above example, we set the value of the `input` tag to the value of the `name` state.
We add an inline event handler to the `onChange` prop of the `input` tag to set the `name` to `e.target.value`.