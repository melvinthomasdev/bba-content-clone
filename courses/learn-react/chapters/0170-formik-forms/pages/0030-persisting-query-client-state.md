The API used to retrieve information about countries and states is being triggered every time a user visits the checkout page after the stale time or across page reloads. However, since the data related to this API does not change frequently, there is no need to send an API request every time. To achieve this, we need to cache the data that is being fetched.

To cache the data, React Query provides an experimental plugin called `persistQueryClient`, which persists the state of your queryClient and caches it for later use. So when your application reloads or when a user revisits the application later, React Query will attempt to restore the query client's state from the cache.

Here is what the networks will look like after implementing `persistQueryClient`.

<image>persist-query-client.gif</image>

To use `persistQueryClient`, we need to call it in our `queryClient.js` file. In this file, we need to import `persistQueryClient` and pass the `queryClient` object to it to determine which query client instance it should persist.

```js
//...
import { persistQueryClient } from "react-query/persistQueryClient-experimental";

//...
persistQueryClient({
  queryClient,
});

//...
```

To store query data, we need to specify a storage mechanism using the `persistor` option. In our case, we will use the browser's local storage to persist the data. To create an instance of the persistor, we can use the `createWebStoragePersistor` function from React Query. This persistor is responsible for managing the storage and retrieval of query cache data. `createWebStoragePersistor` expects an object with a `storage` property, which we will set to `window.localStorage` indicating that the data will be persisted in the browser's local storage.

```js
//...
import { createWebStoragePersistor } from "react-query/createWebStoragePersistor-experimental";

//...
const localStoragePersistor = createWebStoragePersistor({
  storage: window.localStorage,
});
persistQueryClient({
  queryClient,
  persistor: localStoragePersistor,
});

//...
```

Next, we need to set the expiration time for the cached data. For that, we will use the `maxAge` option. In this case, the data will not change frequently and will not need to be updated often unless manually cleared, so we will set the `maxAge` value to `Infinity`.

```js
//...

persistQueryClient({
  queryClient,
  persistor: localStoragePersistor,
  maxAge: Infinity,
});

//...
```

Finally, we need to specify which queries need to have their data persisted. For that, we need to specify the `dehydrateOptions`. This parameter provides the options for dehydrating or serializing. Dehydrating means converting data into a format that can be easily stored in local storage. Within the `dehydrateOptions`, the `shouldDehydrateQuery` function is used to determine which queries should be serialized based on their query keys.

```js
//...
import { QUERY_KEYS } from "constants/query";

//...

persistQueryClient({
  queryClient,
  persistor: localStoragePersistor,
  maxAge: Infinity,
  dehydrateOptions: {
    shouldDehydrateQuery: ({ queryKey }) =>
      [QUERY_KEYS.COUNTRIES, QUERY_KEYS.STATES].some(key =>
        queryKey.includes(key)
      ),
  },
});

//...
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Implemented caching of country and state data using persistQueryClient"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/a5ea895b205271f9c865fc0e296acdf983607ad9)
