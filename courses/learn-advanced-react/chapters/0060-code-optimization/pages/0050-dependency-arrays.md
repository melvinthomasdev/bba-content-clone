As we've shown previously, both the `useEffect` hook and the `useCallback` hook have two arguments, the second of which is what we call the dependency array.

An empty dependency array implies the hook will trigger just once when the component is first rendered.

Otherwise, it is essentially an array of variables that triggers the hook anytime any of the variables change.

Using a dependency array is simple when the variables are primitives like strings, integers and booleans as shown : 

```jsx
const App = () => {
  const [count, setCount] = useState(0)
  const incrementCount = useEffect(() => {
    console.log(`New Count is ${count}`)
  }, [count])

  const clickHandler = () => setCount(prevCount => prevCount + 1)

  return (
    <button onClick={clickHandler}>
      Increment Count
    </button>
  )
};
```

But when your dependency array uses complex values like objects, arrays and functions, this can become an issue as the objects have to be the exact same and can't differ in memory location even if the values are the same as demonstrated below:

```javascript
(() => true) === (() => true) //false
{a: 1, b: 2} === {a: 1, b: 2} //false
[1, 2] === [1, 2] //false
```

## Solutions for complex data in dependency arrays

There are a few workarounds to this problem but the easiest would be to simply break down the complex data and pass on the attributes that need to trigger the hook as shown below: 

```jsx
const App = () => {
  const [counts, setCounts] = useState([0, 0])
  const incrementCount = useEffect(() => {
    console.log(`New Counts are ${counts[0]} & ${counts[1]}`)
  }, [counts[0], counts[1]]) //Break counts into its constituent primitives

  const clickHandler = () => setCounts(
    prevCounts => [prevCounts[0] + 1, prevCounts[1] + 2]
  )

  return (
    <button onClick={clickHandler}>
      Change Counts
    </button>
  )
};
```

Even if the `counts` object is recreated every render, as long as the values of `counts[0]` and `counts[1]` do not change, `incrementCount` will not run.

This method only works if the complex data object has only a few primitives that determine whether the hook needs to be triggered. Since the values of the primitives that make up a complex object do not change, this works like a charm.

If you'd like to explore more on this topic, [this blog by Ben Ilegbodu](https://www.benmvp.com/blog/object-array-dependencies-react-useEffect-hook/) is a great resource to dive deeper into many more methods you can use.