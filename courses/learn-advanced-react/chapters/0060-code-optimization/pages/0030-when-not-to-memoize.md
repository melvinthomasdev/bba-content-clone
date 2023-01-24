When optimizing code, it is important to keep in mind that any memoization does involve extra comparisons on every render. Thus, you may end up with worse performance if every component is wrapped with a `React.memo` without careful consideration.

Do not memoize a component when : 
1. The component re-renders very often due to props that keep changing.
2. The component is already efficient and cheap to re-render.
3. The comparison function is expensive to perform due to:
  * The component having a lot of props
  * The memo having an expensive custom comparison function.

When doing optimization, it is also important to use profilers to quantify any gains you may get from using `React.memo`. If the gains are negligible or non-existent, don't use it.

If you wish to dive into profiling right away, [this video by our folk at BigBinary](https://www.youtube.com/watch?v=_cG-wYPSe9s) explains it well.

Keeping these points in mind, the perfect targets for memoization are large, commonly used, pure functional components.