The `useCallback` hook is similar to the `useMemo` hook we saw in the previous chapter.

The differentating factor however is that unlike `useMemo` which memoizes _the return value_ of a function, `useCallback` returns a memoized callback which doesn't change it's references as long as certain conditions are met.

`useCallback` along with `useMemo` are used very extensively when trying to optimise the performance of functional components and when you're trying to reduce the number of times a specific component re-renders.


## Resources


- [Video 1](https://www.youtube.com/watch?v=IL82CzlaCys)
