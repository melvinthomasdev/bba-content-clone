To debug and monitor queries in your application, React query comes with a useful tool called Devtools. It provides insightful information about the queries and mutations in your application at runtime.

To integrate React Query Devtools into our application, we need to import the `ReactQueryDevtools` component from the `react-query` package at the top level of our application. This ensures that the Devtools are available throughout our application for debugging and monitoring. In the case of the `SmileCart` application, we can add it to the `App` component.

```jsx
import { ReactQueryDevtools } from "react-query/devtools";
// ...

const App = () => (
  <>
    {/* rest of the code */}
    <ReactQueryDevtools initialIsOpen={false} position="bottom-right" />
  </>
);
```

The `position` prop allows us to specify where the Devtools panel should be positioned within the browser window.

Once this setup is complete, you'll notice the React Query logo floating in the bottom right corner of your screen. Clicking on this logo reveals the Devtools pane.

<image>react-query-devtools-panel.png</image>

If you open Devtools in the product listing page, you get to see a lot of information for this query such as query key, whether the data is fresh or stale, last updated time, data inside the cache, etc. Additionally, you can manually reset the state, remove part of it to re-fetch the data, and so on, providing extensive control over query management.

<image>react-query-devtools-actions.gif</image>
