Previously, we explored how pagination divides content into smaller sections for better user access. Maintaining the page number, along with other status information, in shared URLs can be beneficial for users. It helps to preserve their context and have a smooth browsing experience.

Let's consider a scenario: You are searching for `blue jeans` and spotted three good jeans on the second page. Wanting a second opinion, you plan to share this with a friend. When you share the URL, you want your friend to see the second page of `blue jeans` search result, exactly as you saw. But how can this page be shared while keeping the applied filters and the page number intact?

Now, let's consider a second scenario where instead of sharing the URL with a friend, you click on each of your preferred jeans to compare their details. You expect that upon returning to the product list from viewing a product, the pagination and filtering settings are retained. How can this be achieved?

Both of these queries can be addressed by representing the page's state using query parameters. The URL query parameters can be used to save and restore a page's state, including filters, search terms, sorting, and pagination. This way, users can bookmark or share specific page states.

In this lesson, we will focus on two things. First, we'll learn how to save state changes using URL parameters. Then, we'll explore how to use these parameters to recover the state within the SmileCart application.

## Utilizing query parameters for managing pagination

Currently the path for `ProductList` component is `/products`. Let's outline the requirements for changing the URL when interacting with pagination:

- Clicking on a page number in the `Pagination` component should update the URL to include the page number and the default page size as query parameters.
- Opening the application URL with the path `/products?page=2&page_size=8` in a new tab should automatically take us to the second page with eight products.

To fulfill the initial requirement, we'll create a new function called `handlePageNavigation`. This function will be assigned to the `navigate` prop within the `Pagination` component. It will add the new page number and the default page size to the URL when the user navigates to a different page.

```jsx {3-6, 14}
const ProductList = () => {
  // ...
  const handlePageNavigation = page =>
    history.replace(
      buildUrl(routes.products.index, { page, pageSize: DEFAULT_PAGE_SIZE })
    );
  // ...

  return (
    // ...
    <div className="mb-5 self-end">
      <Pagination
        count={totalProductsCount}
        navigate={handlePageNavigation}
        pageNo={currentPage || DEFAULT_PAGE_INDEX}
        pageSize={DEFAULT_PAGE_SIZE}
      />
    </div>
  );
};
```

With the above changes, when we click on a specific page number, say page two, the URL will be updated to `/products?page=2&page_size=8`.

Now, let's address the second requirement by ensuring that when a specific URL is provided with the desired values for query parameters, the page opens with the intended state. In order to achieve this, we will define a custom hook called `useQueryParams` to extract and return the query parameters from the current URL's query string.

Let's create a `useQueryParams.js` file within the `src/hooks` folder.

```bash
touch src/hooks/useQueryParams.js
```

We will use `useLocation` hook from the `react-router-dom` to retrieve the details of the current URL. We can pick the `search` property from it to get the query param as a string: `"?page=2&page_size=8"`. Then we'll employ the `parse` function from [`qs`](https://www.npmjs.com/package/qs) library to process the key-value pairs in the query string into an object. It supports `ignoreQueryPrefix` flag to ignore the leading question mark in the query param string. We will also use the `keysToCamelCase` function to convert the keys of the parameter object from snake_case to camelCase.

```jsx
import { keysToCamelCase } from "neetocist";
import { parse } from "qs";
import { useLocation } from "react-router-dom";

const useQueryParams = () => {
  const location = useLocation();
  const queryParams = parse(location.search, { ignoreQueryPrefix: true });

  return keysToCamelCase(queryParams);
};

export default useQueryParams;
```

Now, within the `ProductList/index.jsx` file, we will invoke the `useQueryParams` hook to get the query parameter object. This object is also destructured into `page` and `pageSize` for ease of access.

```jsx {1-2, 7-8}
import useQueryParams from "hooks/useQueryParams";
// ...

const ProductList = () => {
  // ...
  const queryParams = useQueryParams();
  const { page, pageSize } = queryParams;
  // ...
};
```

With `page` being directly accessible via query parameters, there's no need for the `currentPage` state in the `ProductList` component. Let's proceed to remove the following line:

```jsx
const [currentPage, setCurrentPage] = useState(DEFAULT_PAGE_INDEX);
```

Next, we'll substitute all instances of `currentPage` with `page` throughout the component. Query parameters extracted from the URL are strings. `Number(page)` explicitly converts the extracted page value from a string to a numeric type.

```jsx {5, 6, 13-19, 28-29}
const ProductList = () => {
  // ...
  const productsParams = {
    searchTerm: debouncedSearchKey,
    page: Number(page) || DEFAULT_PAGE_INDEX,
    pageSize: Number(pageSize) || DEFAULT_PAGE_SIZE,
  };

  const { data: { products = [] } = {}, isLoading } =
    useFetchProducts(productsParams);

  // ...
  const handlePageNavigation = page =>
    history.replace(
      buildUrl(
        routes.products.index,
        mergeLeft({ page, pageSize: DEFAULT_PAGE_SIZE }, queryParams)
      )
    );
  // ...

  return (
    // ...
    <div className="mb-5 self-end">
      <Pagination
        count={totalProductsCount}
        navigate={handlePageNavigation}
        pageNo={Number(page) || DEFAULT_PAGE_INDEX}
        pageSize={Number(pageSize) || DEFAULT_PAGE_SIZE}
      />
    </div>
  );
};
```

With that, we have effectively employed query parameters to control the pagination state.

## Utilizing query parameters for managing search

The following points articulate our requirements for the behaviour of search input field:

- Using the search input to search for a query should update the URL by adding the `search_term` as a query parameter. The `page` and `page_size` should revert to their default values.
- When opening the application URL with the path `/products?page=1&page_size=8&search_term=mac` in a new tab, it should automatically direct us to the initial page, displaying a maximum of eight products containing the term "mac".

We can fulfill the second requirement using the same approach we employed for `pages` by utilizing `useQueryParams`. We will also modify the `productsParams` and the default value of the `searchKey` state to incorporate the `searchTerm`.

```jsx {1, 5-8, 12}
import useQueryParams from "hooks/useQueryParams";
// ...

const ProductList = () => {
  const queryParams = useQueryParams();
  const { page, pageSize, searchTerm = "" } = queryParams;

  const [searchKey, setSearchKey] = useState(searchTerm);
  // ...

  const productsParams = {
    searchTerm,
    page: Number(page) || DEFAULT_PAGE_INDEX,
    pageSize: Number(pageSize) || DEFAULT_PAGE_SIZE,
  };

  const { data: { products = [] } = {}, isLoading } =
    useFetchProducts(productsParams);
  // ...
};
```

With that, we are ready to address the first requirement of updating the query parameters in the URL when a user enters a query. We'll start by creating a `updateQueryParams` event handler for updating the query parameters in response to changes in the input. Also, inside this handler we will update the `searchKey` state with the value entered by the user.

```jsx {1, 5-15, 12, 24}
import { filterNonNull } from "neetocist";
// ...
const ProductList = () => {
  // ...
  const updateQueryParams = ({ target: { value } }) => {
    const params = {
      page: DEFAULT_PAGE_INDEX,
      pageSize: DEFAULT_PAGE_SIZE,
      searchTerm: value || null,
    };

    setSearchKey(value);

    history.replace(buildUrl(routes.products.index, filterNonNull(params)));
  };
  // ...
  return (
    // ...
    <Input
      placeholder={t("searchProducts")}
      prefix={<Search />}
      value={searchKey}
      type="search"
      onChange={updateQueryParams}
    />
    // ...
  );
};
```

From now on, any changes in the input will prompt an update in the URL to mirror the search query.

Moving forward, we're not going to debounce the search value using the `useDebounce` hook. Instead, we'll delay running the code that updates the query parameters. We'll do this by building another hook called `useFuncDebounce`. As a result, the `useDebounce.js` file is no longer needed, you can go ahead and remove the file and also we need to remove its usage from the `ProductList` component.

Let's create the `useFuncDebounce.js` file inside `src/hooks` folder.

```bash
touch src/hooks/useFuncDebounce.js
```

Within the `useFuncDebounce.js` file, we will define the `useFuncDebounce` hook. This hook will accept a function, `func`, as its parameter and returns a debounced version of the function, `debouncedFunc`. This debounced function ensures that the input function, `func`, is not called immediately when requested but only after a specified delay of 350 milliseconds after the last function call.

```jsx
import { useRef } from "react";

const useFuncDebounce = func => {
  const timer = useRef(null);
  const debouncedFunc = (...args) => {
    clearTimeout(timer.current);
    timer.current = setTimeout(() => func(...args), 350);
  };

  return debouncedFunc;
};

export default useFuncDebounce;
```

We'll now swap out the prior `updateQueryParams` event handler for a debounced counterpart that bears the same name. As we only need to debounce the query params updating logic, we need to move the `setSearchKey` function out of the `updateQueryParams`.

```jsx {1, 5, 23-26}
import useFuncDebounce from "hooks/useFuncDebounce";
// ...
const ProductList = () => {
  // ...
  const updateQueryParams = useFuncDebounce(value => {
    const params = {
      page: DEFAULT_PAGE_INDEX,
      pageSize: DEFAULT_PAGE_SIZE,
      searchTerm: value || null,
    };

    history.replace(buildUrl(routes.products.index, filterNonNull(params)));
  });
  // ...

  return (
    // ...
    <Input
      placeholder={t("searchProducts")}
      prefix={<Search />}
      type="search"
      value={searchKey}
      onChange={({ target: { value } }) => {
        updateQueryParams(value);
        setSearchKey(value);
      }}
    />
    // ...
  );
};
```

With that, we've adjusted the `ProductList` component to retrieve and use `searchTerm` and `page` directly from the query parameters.

Let's commit the new changes:

```bash
git add -A
git commit -m "Adjusted ProductList component to use query parameter info"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/cb278bb6352012114857ade94afb3ce1d59dabfe).
