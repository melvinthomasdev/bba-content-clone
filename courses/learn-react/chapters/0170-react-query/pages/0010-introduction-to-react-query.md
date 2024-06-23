So far, we have been using the `useEffect` hook for data fetching and the `useState` hook to maintain component states like loading, error, or resulting data. However, handling complex data-fetching scenarios, caching, managing the state of asynchronous operations and error handling can become challenging as our application grows. This is where [React Query](https://tanstack.com/query/v3/docs/react/overview) comes into the picture. React query is a powerful data management library that simplifies these tasks by providing a declarative and composable API of hooks.

### Main advantages of using React Query

1. It minimizes unwanted refetching of data by reusing the cached one. It uses a cache-first approach.
2. It allows different components to use the same API response data without both of them having to send API requests.
3. It allows direct cache updates, which eliminates the need for a separate GET request after a POST request to retrieve updated data. As a result, we can reuse the edited cache.
4. It reduces the boilerplate code for state handling, loading, error handling, etc., while fetching and updating the server data.

### Setting up React Query

To install React Query version 3 using `yarn`, open the terminal and navigate to the project directory. Then, run the following command.

```bash
 yarn add react-query@3
```

React query enables us to create an instance of a class called `QueryClient`. It serves as a central store to manage API calls and mutations. `QueryClient` offers several configuration options such as `mutationCache`, `queryCache`, `defaultOptions`, etc. to customize its behavior.

In our case, we will make use of the `queryCache` option to create a new instance of the `QueryCache` class. This `queryCache` instance is responsible for caching the results of your API calls, making it easy to retrieve data without making unnecessary network requests.

At BigBinary, we follow the convention of creating the query client instance in the `utils/queryClient.js` file.
Use the below command to create the `queryClient.js` file.

```bash
touch src/utils/queryClient.js
```

Now, let's initialize the query client instance within this file.

```js
import { QueryClient, QueryCache } from "react-query";

const queryClient = new QueryClient({
  queryCache: new QueryCache(),
});

export default queryClient;
```

`QueryClient` also allows us to set default settings for all the API calls that we create using this query client instance by utilizing the `defaultOptions` option. In our case, we will be setting two default options:

1. `refetchOnWindowFocus`: This option determines whether the API calls should automatically refetch when the window/tab gains focus. We will be setting it to `false`.

2. `staleTime`: This option specifies how long the data needs to be preserved. After the specified time has passed, React Query will consider the data as stale and trigger a refetch if the same data is accessed again. We will set it to `3_600_000` milliseconds (1 hour).

Now let's see how we can add `defaultOptions` to the query client instance.

```js
import { QueryClient, QueryCache } from "react-query";

const queryClient = new QueryClient({
  queryCache: new QueryCache(),
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      staleTime: 3_600_000,
    },
  },
});

export default queryClient;
```

React Query internally uses context to manage the API calls data. Therefore, wrapping our application with `QueryClientProvider` component from the React Query ensures that the API response data will be available to all components.

The `QueryClientProvider` component takes a single prop, `client`, which should be an instance of `QueryClient`. In our case, we will be adding it in the `src/index.jsx` file. Now, let's see this in action.

```jsx {8,13}
import { QueryClientProvider } from "react-query";
import queryClient from "utils/queryClient";
// rest of the imports

// ...
root.render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <ToastContainer />
        <App />
      </BrowserRouter>
    </QueryClientProvider>
  </React.StrictMode>
);
```

In the next lesson, we will learn about how to make API calls using React query.

Let's commit the new changes:

```bash
git add -A
git commit -m "Initialized query client instance"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/e5e8b891e23b795b962440f508f097b014d34a00).
