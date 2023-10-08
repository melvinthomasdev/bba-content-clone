A commonly made mistake among newcomers to React is to initialize the state without an initial value like this:

```jsx
const Weather = () => {
  const [weather, setWeather] = useState()

  return (
    <>
      {weather && <h1>It is {weather} right now!</h1>}
      <button onClick={() => setWeather('sunny')}>
        Is it Sunny?
      </button>
      <button onClick={() => setWeather('rainy')}>
        Is it Rainy?
      </button>
    </>
  )
}
```

Setting a state without an initial value gives it a value of `undefined` by default.

While the above code runs just fine, the statement `const [weather, setWeather] = useState()` does not tell a reader whether the state is an integer, string, boolean, array, or some other type of value. This is something they have to decipher by going through the entire code which can be a hassle if your component is large.

We can avoid this confusion by setting an initial value of the same type like this:

```jsx
const Weather = () => {
  const [weather, setWeather] = useState('')

  return (
    <>
      {weather != '' && <h1>It is {weather} right now!</h1>}
      <button onClick={() => setWeather('sunny')}>
        Is it Sunny?
      </button>
      <button onClick={() => setWeather('rainy')}>
        Is it Rainy?
      </button>
    </>
  )
}
```

Also, keep in mind that if your code does any operations to the state such as `state.push(5)` or `state + 5`, this has the potential to cause bugs if not caught as `undefined` doesn't have properties/methods and arithmetic with `undefined` gives you `NaN`.