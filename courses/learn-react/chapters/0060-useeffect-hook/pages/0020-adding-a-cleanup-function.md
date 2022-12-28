If we need to add a cleanup function, we just need to return a function from our effect.
This cleanup function will run once your component unmounts. Below are a few common uses for the cleanup function.

## Clearing Timers

We can use the cleanup function to clear timers like so:

```jsx
useEffect(() => {
  const timer = setTimeout(() => {
    console.log('Run 5 seconds after initial mount')
  }, 5000);

  return () => clearTimeout(timer);
}, []);
```

## Removing Listeners

We can also remove event listeners using the cleanup function like so:

```jsx
useEffect(() => {
  const locateClick = e => console.log(e.clientX, e.clientY)
  window.addEventListener('click', handleScroll);

  return () => window.removeEventListener('click', handleScroll);
}, []);
```

