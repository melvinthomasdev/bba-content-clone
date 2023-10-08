If we need to add a cleanup function, we just need to return a function from our effect.

You can use the following syntax to do so:

```jsx
useEffect(() => {
  // function effects
  const cleanupFunction = () => {
    // cleanup function definition
  }
  return cleanupFunction
}, [])
```

This cleanup function will run once your component unmounts.
Here are a few common uses for the cleanup function.

## Clearing Timers

We can use the cleanup function to clear timers like this:

```jsx
useEffect(() => {
  const timer = setTimeout(() => {
    console.log('Run 5 seconds after initial mount')
  }, 5000);

  return () => clearTimeout(timer);
}, []);
```

## Removing Listeners

We can also remove event listeners using the cleanup function like this:

```jsx
useEffect(() => {
  const locateClick = e => console.log(e.clientX, e.clientY)
  window.addEventListener('click', handleScroll);

  return () => window.removeEventListener('click', handleScroll);
}, []);
```

