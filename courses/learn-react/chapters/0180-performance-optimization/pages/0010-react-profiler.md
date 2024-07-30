As we discussed at the beginning of this course, React uses Virtual DOM to compare the changes and bring the application to the desired state with the least amount of DOM manipulation, making React applications faster and more efficient.

However, as the application grows in size and complexity, there arise a need for performance optimization from our part because of the following reasons:

**Component Re-renders**: Larger and more complex applications may often have many components, and some of them may re-render frequently. Unnecessary re-renders can lead to performance issues, as, even with React's Virtual DOM, there is still a cost associated with computing and [reconciling](https://legacy.reactjs.org/docs/reconciliation.html) the virtual and actual DOM trees.

**State Management**: Managing the application state becomes more challenging as the application grows. Complex applications may have states scattered across different components or even shared across the application. Understanding how state changes propagate through the component tree can make it easier to reduce unnecessary state updates. Zustand and Context API come in handy for this.

**Rendering Tree Depth**: As the component tree becomes deeper and more nested, it can impact performance.

**Data Fetching and API Calls**: Large applications often make many API calls and fetch significant amounts of data. In such applications, we may need to optimize data fetching by applying techniques such as batching requests, data caching, pagination or lazy loading. We have already seen how React query helps us to handle data fetching efficiently.

**Memory Leaks**: Complex applications are more prone to memory leaks, especially when managing event listeners, subscriptions, or long-lived objects.

**Third-Party Libraries**: As applications grow, they tend to rely on more third-party libraries and dependencies. Identifying performance issues caused by these libraries and making informed decisions about whether to optimize, replace, or reduce their usage is critical to the performance of an application.

**User Experience**: Large applications have a diverse user base with varying hardware and network conditions. Performance bottlenecks of such applications may be more pronounced in certain devices or network connections than others. To ensure a consistent and smooth user experience for most users, we need to optimize the performance of our application, considering various hardware and network conditions.

To identify and analyze performance bottlenecks in a React application, the React team ships a tool called **Profiler** as part of the React DevTools browser extension. Profiler helps us record the performance information of our application and visualize the application's rendering timeline. If you haven't used React DevTools before, refer to the [official documentation](https://react.dev/learn/react-developer-tools) to install it.

# How to use the React DevTools Profiler?

## Recording performance data

Start the application with the `yarn start` command, and wait for the application to open in the browser. Open your browser's developer tools and switch to the ***Profiler*** panel.

<image>open-react-profiler.png</image>

Click the `Record` button in the Profiler tab to start profiling.

<image>start-profiling.png</image>

Once we start a profiling session, we can interact with the application as we normally would, performing the actions or scenarios we want to profile, such as clicking buttons or navigating pages. Once we've completed those actions, click the `Record` button to end the recording.

<image>stop-profiling.png</image>

Let's try this by recording the process of adding a product to the cart.

<image>profile-add-to-cart-feature.gif</image>

## Analyzing performance data

Once we finish profiling, we can view the performance data in several ways. Let's go through them one by one.

### Browsing commits

Conceptually, React does work in two phases:

 - The **render** phase determines what changes need to be made to the DOM.
 - The **commit** phase is when React applies changes to the DOM.

The performance data in DevTools profiler is grouped by commits. Commits are displayed at the top right part of the Profiler panel.

<image>profiler-commits.png</image>

Each bar in the above chart represents a single commit with the currently selected commit colored blue. The color and height of each bar corresponds to how long that commit took to render. Taller, yellow bars took longer than shorter, green bars.

We can navigate between different commits by clicking on a bar or using arrow buttons.

<image>browsing-commits.gif</image>

### Flame chart

The Flame Chart represents an application's component hierarchy during a specific commit. Each bar on the chart corresponds to a React component.

Here's the Flame Chart for the first commit of our profiling session, where we added a product to the cart:

<image>flame-chart.png</image>

The size and colour of each bar indicate how long it took to render the component and its children. Grey bars mean the components didn't render during the selected commit, while yellow bars represent the most time-consuming renders.

In our case, only the `Header` and `AddToCart` components, along with their children, rendered during the commit.

You can not only see which components got rendered during a commit but also understand why a specific component was rendered. For that, you need to enable the settings shown below:

<image>record-why-component-rendered.gif</image>

Profile the "Add to Cart" feature with this updated setting. Now, when you hover over a component, you can see why it is rendered:

<image>why-components-rendered.gif</image>

Here, the `Header` component rendered because `Hook 3` changed, and the `AddToCart` component rendered because `Hook 10` changed.

However, this information is not sufficient. We need to identify the exact hook corresponding to these numbers to understand why a component was rendered. To do that, you can use the component panel of React DevTools. Search for the `Header` component in the component panel to reveal details about the `Header` component, like props, states, and hooks:

<image>component-panel.gif</image>

From the component panel, we can see that the `Header` component has two hooks: `History`, associated with the `useHistory` hook, and `BoundStore`, associated with the Zustand store. You can confirm this from the `Header.jsx` file in the repository:

```jsx
const history = useHistory();

const cartItemsCount = useCartItemsStore(
  store => values(prop("cartItems", store)).length
);
```

You might wonder why the Profiler referred to `Hook 3` when the `Header` component only has two hooks. The key here is to understand that the Profiler's references point to built-in React hooks either directly used within the component or nested within our custom hooks or third-party library hooks used in that component.

In our case, `useHistory` is a hook from `react-router-dom` and `useCartItemsStore` is a custom hook. Therefore, these hooks don't have any number associated with it. So, the hook number referred to in the Profiler must be a hook used within these custom hooks. To find out, let's delve into more details about these hooks:

<image>hooks-from-number.png</image>

Within the `BoundStore` hook, you can see four hooks numbered from 1 to 4, as shown in the image above. Among them, `SyncExternalStore` numbered 3 is the hook we were searching for. This hook triggered a re-render of our `Header` component. The hook `SyncExternalStore` corresponds to the react hook [`useSyncExternalStore`](https://react.dev/reference/react/useSyncExternalStore) used for subscribing to an external store. Zustand uses this hook to synchronize the changes in its store values.

When we added a product to the cart, the `cartItems` object was updated. This modification, in turn, prompted the `useSyncExternalStore` hook to update the `cartItems` wherever it was being utilized. Consequently, the `Header` component underwent a re-render.

Even though we don't need to understand the implementation details of `Zustand`, identifying the exact hook has helped us to trace back to the cause of the re-rendering of the `Header` component.

Phew! That was a lot to digest.

Lastly, clicking on a component in the Flame Chart allows us to zoom in on that component and its children. This action reveals the frequency of the component's rendering during the profiling session and the reasons behind each rendering:

<image>stepping-into-a-component.gif</image>

### Ranked chart

In addition to the flame chart, the Profiler also provides timing information for each component, ordered by their render duration, with the component that took the longest to render listed at the top.

<image>ranked-chart.png</image>

## Highlighting updates

The React DevTools profiler allows us to highlight the component updates while interacting with the app, even without recording a specific action using the `Record` option:

<image>highlight-updates.gif</image>

To enable this feature, you can use the settings shown below:

<image>settings-to-highlight-rendering.png</image>

> Note: These highlights are visible only when the Developer Tools panel is open while interacting with the app.

Hope you have got a basic understanding of how to use the Profiler in React DevTools.

In the next lesson, we will see how we can reduce the unnecessary component rerenders using [memoization](https://en.wikipedia.org/wiki/Memoization) and how profiler helps in this optimization process.
