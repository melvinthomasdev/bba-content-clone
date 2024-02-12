In the previous lesson, we saw how Profiler generates trace information that helps in understanding the sequence of events during rendering. In this lesson, we will see how this trace information can help us identify performance bottleneck in our application. We will also delve into solutions for tackling these performance issues.

First, let's see the type of problems React Profiler can generally assist us in identifying.

- It allows us to measure and analyze the render times of individual components. This insight helps in identifying components that takes longer to render.
- It helps in understanding how often components are re-rendered and the reasons behind those updates. This can uncover unnecessary re-renders.
- It provides a visual representation of component relationships. Understanding how components are nested and how changes in one component affect others helps in optimizing the component tree structure.

Now that we have an idea of the problems to look for, let's inspect the product listing page of the SmileCart application. Record the rendering process of searching and adding a few products to the cart. Ensure that you have configured the settings to show why a particular component is rendered.

<image>search-and-add-to-cart.gif</image>

Among the commits recorded, select the tallest yellow-coloured bar. This bar corresponds to the commit that took the longest time.

<image>longest-bar.png</image>

Within the flame chart linked to the selected commit, click on the `ProductList` component to enlarge and examine its details. On the right side, you'll see the duration of this component's rendering. Make a note of this value for future comparisons. You will also notice multiple re-renders of the child component `ProductListItem`. When you hover over the bars associated with this component, some of them will show the reason for rendering as `The parent component rendered`.

<image>profile-before-memoization.png</image>

The message `The parent component rendered` in React Profiler occurs because whenever a parent component re-renders, React will typically re-render all its child components, regardless of whether the child's props or state have changed. However, unnecessary re-rendering of a component without changes in its props or state can negatively impact performance.

Methods for optimization, such as memoization, can prevent these unneeded rendering cycles, leading to a reduction in rendering time. We will see more about this in the next section.

## Memoization

Memoization is a technique used to optimize performance by caching the results of expensive computations and preventing unnecessary re-computation of values. This technique aims to improve performance by storing the results of expensive function calls and returning the cached result when the same inputs occur again.

In React, the `React.memo` higher-order component and the `useMemo` hook are used for memoization:
- `React.memo`: When a functional component, wrapped with `React.memo` HOC, receives the same props, it skips re-rendering and returns the last rendered result that's stored in memory.
- `useMemo`: It memoizes the result of a function or computation and re-runs it only when the dependencies provided in the dependency array change.

Let us bring memoization to SmileCart by wrapping the stateless `ProductListItem` component with `React.memo`.

```jsx {1, 8}
import { memo } from "react";
// ...

const ProductListItem = ({ /* props */ }) => (
  // ...
);

export default memo(ProductListItem);
```

We will do the same for the following light-weight components: `PriceCard`, `ProductCard`, `Header` and `Carousel`.

Now if we record the profiler again for the same operation, we will notice a substantial improvement in the performance as reflected by the rendering time. Moreover, there won't be any `ProductListItem` component renders with the reason `The parent component rendered`.

<image>profile-after-memoization.png</image>

Though we've delved into how memoization optimizes applications, it's important not to prematurely memoize components by indiscriminately wrapping every component with memo. This approach might not be suitable in the following scenarios:

- Infrequent component rerenders.
- Trivial or lightweight computations that don't significantly impact performance.
- Unlikelihood of reusing or recalculating memoized values.
- A constant need for computing and providing the most recent data.
- When the memory usage from caching values surpasses potential performance gains.

## References
- https://www.bigbinary.com/blog/react-performance-optimization-memoization-demystified

Let's commit the new changes:

```bash
git add -A
git commit -m "Enhanced app performance using memoization"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/6a6c5e7523671835cd3ccdb0fd44a2459068b9b8).
