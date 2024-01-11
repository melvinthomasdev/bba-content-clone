When we have a large set of data to display to the user, we employ a technique called Pagination to retrieve and present that data in smaller chunks known as pages. Pagination enhances application performance by retrieving only a subset of the whole data at a time, thereby lowering API response time and ultimately improving user experience.

Pagination requires changes on backend as well as frontend. The frontend should add an extra parameter to the API request specifying the index of the page it needs to display. Backend should retrieve data subset from the DB based on the provided page index.

Our backend API server already supports pagination for the product listing API we used in the previous lesson. The API accepts the queryParams `page` and `page_size`. Based on these parameters, the API splits the data into different pages, each containing a `page_size` number of records, and then retrieves the requested page's records.

In this lesson, we will implement a pagination mechanism in our product listing page.

This is how the page will look after implementing the pagination:

<image>product-listing-page-with-pagination.gif</image>

To accommodate this change, let's go to the `ProductList/index.jsx` file and create a state named `currentPage` to store the current page number. We should initialize the state with a default page number of `1`.

```js
const [currentPage, setCurrentPage] = useState(1);
```

Next, we will modify the arguments that have been passed to the `useFetchProducts` hook to include the `page` and `page_size` properties. We will pass `currentPage` as the value to the `page` key and, the default page size of `8` as the value to the `pageSize` key. This is how you can modify the arguments passed to the `useFetchProducts` hook:

```jsx {9-10}
// ...

const ProductList = () => {
  const [currentPage, setCurrentPage] = useState(1);
  // ...

  const productsParams = {
    searchTerm: debouncedSearchKey,
    page: currentPage,
    pageSize: 8,
  };

  const { data: { products = [] } = {}, isLoading } =
    useFetchProducts(productsParams);

  // ...
};
```

Moving on, we will be using default records per page and default page number in multiple places. To make it easier to manage and update them let's move it to a constant file instead of hardcoding them as magic literals. Let us create a file named `constants.js` under the `ProductList` directory.

```bash
touch src/components/ProductList/constants.js
```

Inside the `constants.js` file, set the default records per page and default page number as follows:

```js
export const DEFAULT_PAGE_SIZE = 8;

export const DEFAULT_PAGE_INDEX = 1;
```

Now, go to the `ProductList/index.jsx` file and replace the hardcoded values for the default records per page and default page number with these constants.

```jsx {5, 11}
import { DEFAULT_PAGE_INDEX, DEFAULT_PAGE_SIZE } from "./constants";
// ...

const ProductList = () => {
  const [currentPage, setCurrentPage] = useState(DEFAULT_PAGE_INDEX);
  // ...

  const productsParams = {
    searchTerm: debouncedSearchKey,
    page: currentPage,
    pageSize: DEFAULT_PAGE_SIZE,
  };

  const { data: { products = [] } = {}, isLoading } =
    useFetchProducts(productsParams);

  // ...
};
```

### Create UI for pagination

To create the UI for pagination, we can use the [Pagination](https://neeto-ui.neeto.com/?path=/docs/components-pagination--default) component from `neetoUI` library.

Within this component, we'll make use of the `navigate` prop to update the `currentPage` state with the page number as the user clicks the navigate buttons.

```jsx {11}
import { Pagination } from "neetoui";

// ...

const ProductList = () => {
  // ...

  return (
    // ...
    <div className="mb-5 self-end">
      <Pagination navigate={page => setCurrentPage(page)} />
    </div>
  );
};
```

Next, we will also make use of the `count` prop to specify the total number of products that need to be paginated. Since the product listing API returns the count for the total products, we can extract the `totalProductsCount` property from the `data` object of the `useFetchProducts` hook and pass the `totalProductsCount` to the `count` prop.

```jsx {6-7, 14-17}
// ...

const ProductList = () => {
  // ...

  const { data: { products = [], totalProductsCount } = {}, isLoading } =
    useFetchProducts(productsParams);

  // ...

  return (
    // ...
    <div className="mb-5 self-end">
      <Pagination
        navigate={page => setCurrentPage(page)}
        count={totalProductsCount}
      />
    </div>
  );
};
```

Finally, we will pass the `currentPage` state to the `pageNo` prop and `DEFAULT_PAGE_SIZE` to the `pageSize` prop to specify the current page number and to specify the default number of records on a single page.

```jsx {4-5}
<Pagination
  navigate={page => setCurrentPage(page)}
  count={totalProductsCount}
  pageNo={currentPage}
  pageSize={DEFAULT_PAGE_SIZE}
/>
```

### Reset the page number on search

We have an edge case with the pagination mechanism we have built so far. When you go to page 3 and try to search for a product, you may come across a "No products to show" page.

<image>pagination-issue-in-product-listing-page.gif</image>

The issue happens because the page number being sent to the server is `3` along with the search term. Sometimes the number of items matching the searched term won't span over 3 pages. In that case, we get an empty response and we end up displaying the `no products` page.

To fix this issue, we should reset the page number to `DEFAULT_PAGE_INDEX` upon searching. This ensures that the search starts from the first page, allowing us to retrieve the relevant search results. Let's take a look:

```jsx {17}
import { DEFAULT_PAGE_INDEX, DEFAULT_PAGE_SIZE } from "./constants";
// ...

const ProductList = () => {
  // ...

  return (
    // ...
    <div className="flex h-screen flex-col">
      <Header
        //...
        actionBlock={
          <Input
            //...
            onChange={e => {
              setSearchKey(e.target.value);
              setCurrentPage(DEFAULT_PAGE_INDEX);
            }}
          />
        }
      />
      {/* rest of the code */}
    </div>
  );
};
```

### Better Paginated Queries

As you navigate through different pages, you might notice that the UI occasionally transitions in and out of the loading state as different queries are generated.

<image>pagination-without-keep-previous-data.gif</image>

To provide a smooth user experience, we can make use of the `keepPreviousData` option in the `useQuery` hook. Enabling this option will help to keep data from the last successful fetch while new data is being requested, even though the query key has changed. When the new data arrives, the previous data is seamlessly swapped to show the new data.

Now let's modify the `useFetchProducts` hook in the `useProductsApi.js` file to enable the `keepPreviousData` option.

```js {5}
export const useFetchProducts = params =>
  useQuery({
    queryKey: [QUERY_KEYS.PRODUCTS, params],
    queryFn: () => productsApi.fetch(params),
    keepPreviousData: true,
  });
```

This is how the pagination works after enabling the `keepPreviousData` option:

<image>pagination-with-keep-previous-data.gif</image>

Now you can see that the loader won't appear as you navigate through different pages.

Let's commit the new changes:

```bash
git add -A
git commit -m "Added pagination to product listing page"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/e59973648cfafb9dd28ef1ac666a8714b3fee051).
