### Invalidating queries

We already learned that React query provides a powerful caching mechanism that can help prevent unnecessary API calls by storing the results of API requests in a cache. However, if there are changes in the data, it becomes stale and needs to be refreshed with the latest data from the server. To achieve this React query provides a function called `invalidateQueries` which lets you manually invalidate the queries, meaning marking query data as outdated or stale. Once a query is marked as stale, React Query will automatically refetch the latest data.

Using `invalidateQueries` is straightforward. You can call it directly from the React Query's `queryClient` instance. It accepts a specific query key or an array of query keys for invalidation.

For example, consider a scenario where you want to create a new create a new todo, after adding a new todo, you want to refresh the list to reflect the latest changes.

```js
import { useQueryClient, useMutation } from "react-query";
import todosApi from "apis/todos";

export const useCreateTodo = () => {
  const queryClient = useQueryClient();

  return useMutation(todosApi.create, {
    onSuccess: () => {
      queryClient.invalidateQueries("todos-list");
    },
  });
};
```

If you want to invalidate multiple queries you can do like this:

```js
queryClient.invalidateQueries(["todos-list", "projects-list"]);
```

### Updating React query cache

There will be cases where users expect immediate feedback when they perform actions. Waiting for a server response before updating the UI can lead to a sluggish or unresponsive user experience. To solve this, React Query provides a method called `setQueryData` that allows you to manually update the cached data for a specific query without refetching it from the server.

The `setQueryData` method accepts two arguments: the `queryKey` representing the query whose data you want to update, and the `newData` representing the updated data to be set for the query.

```js
queryClient.setQueryData(queryKey, newData);
```

For example, consider a scenario when a user is trying to update the title of a todo and we aim to provide immediate feedback by optimistically updating these changes. To achieve this, we need to update the query cache before the mutation function is executed. We will utilize the `onMutate` callback available in the `useMutation` hook, which is executed before the mutation function and is passed the same variables the mutation function would receive.

```jsx
import { useQueryClient, useMutation } from "react-query";
import todosApi from "apis/todos";

export const useUpdateTodo = ({ id }) => {
  const queryClient = useQueryClient();

  return useMutation(todosApi.update, {
    onMutate: data => queryClient.setQueryData(["todo", id], data),
    onSuccess: () => {
      //rest of the logic
    },
  });
};
```

In case the todo update API fails, we need to rollback the optimistic changes. We will use the `onError` callback to achieve this. Inside `onError`, we retrieve the previous data from the `context` object, which is then set as the data in the cache using `setQueryData`.

```jsx
import { useQueryClient, useMutation } from "react-query";
import todosApi from "apis/todos";

export const useUpdateTodo = ({ id }) => {
  const queryClient = useQueryClient();

  return useMutation(todosApi.update, {
    //...
    onError: (_err, _vars, context) =>
      queryClient.setQueryData(["todo", id], context.previousData),
  });
};
```
