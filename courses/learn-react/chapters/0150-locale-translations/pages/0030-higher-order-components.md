In this lesson, we will learn how we can add titles to our pages. The page title is an essential part of a web page as it provides a concise and meaningful description of the content on that particular page.

Adding a page title is important for several reasons:

**1. SEO (Search Engine Optimization):** Search engines use page titles as one of the factors to understand the content of a page. A relevant and descriptive title can improve the page's visibility in search engine results, potentially increasing organic traffic.

**2. Browser Tabs:** Titles are displayed on browser tabs, allowing users to easily switch between multiple open tabs. A well-crafted title helps users identify the content without having to click on each tab.

**3. User Experience:** A clear and relevant title helps users quickly understand the purpose of a page. It sets expectations and provides context, making navigation more intuitive.

**4. Bookmarking:** When users bookmark a page, the title is often used as the default name for the bookmark. A meaningful title makes it easier for users to identify and organize their bookmarks.

We will be using the [react-helmet](https://www.npmjs.com/package/react-helmet) library to dynamically set the page title. `react-helmet` allows you to manage the changes to the head of the document within your components. It allows us to dynamically update the page title, meta tags, and other elements in the document head.

Run the following command to install `react-helmet`.

```bash
yarn add react-helmet@6.1.0
```

Let's see how we can add a page title using `react-helmet` in our `Cart/index.jsx` file. We will be using the `Helmet` component from `react-helmet`. The `Helmet` component will take plain HTML tags and it will add them to the head of the document.

```jsx {1, 9-11}
import { Helmet } from "react-helmet";
//...

const Cart = () => {
  // ...

  return (
    <>
      <Helmet>
        <title>My cart</title>
      </Helmet>

      {/* rest of the code */}
    </>
  );
};
```

This is how the page title looks on the cart page:

<image>cart-page-with-page-header.png</image>

Instead of using `Helmet` in each component to add a page title, we will use a Higher-order Component (HOC) to add the title to our components. HOCs are a pattern that allows you to reuse component logic. They are functions that take a component as an argument and return a new component with enhanced capabilities.

### Using HOC to add page title

Let's create a file called `withTitle.jsx` where we'll implement our logic for the HOC. We will keep our HOCs in the `src/utils` folder.

Keep in mind that it's a general convention to prefix HOCs with the term `with`.

```bash
touch src/utils/withTitle.jsx
```

Inside this file, we will create a higher-order component function called `withTitle` that accepts two parameters: `Component` and `title`. The `Component` parameter specifies to which component the title will be added, and the `title` parameter represents the title that should be added.

First, we will define a component named `PageTitle` within the `withTitle` function. `PageTitle` will render the original component along with `Helmet` containing the `title`. `PageTitle` will accept and forward `props` directly to the original component ensuring that all the intended props are accepted.

If `title` is not provided, we will render the page title as `Smile cart` as default.

```jsx
import { t } from "i18next";
import { Helmet } from "react-helmet";

const withTitle = (Component, title) => {
  const PageTitle = props => {
    const pageTitle = title ? t("pageTitle", { title }) : t("title");

    return (
      <>
        <Helmet>
          <title>{pageTitle}</title>
        </Helmet>
        <Component {...props} />
      </>
    );
  };

  return PageTitle;
};

export default withTitle;
```

Next, we will add the translation keys `pageTitle` and `title` to `en.json`.

```json
{
  "title": "Smile Cart",
  "pageTitle": "{{title}} | Smile Cart"
}
```

Now, we will see how we can use the `withTitle` HOC to add page title to our `Cart` component.

First, revert the changes made in the `Cart/index.jsx` file. Use the following code in the terminal.

```bash
git checkout -- src/components/Cart/index.jsx
```

Then, make the following changes so that `withTitle` returns the `Cart` component with the page title.

```jsx {1, 8}
import i18n from "i18next";
// ...

const Cart = () => {
  // ...
};

export default withTitle(Cart, i18n.t("cart.title"));
```

Also, add the translation key `cart.title` to `en.json` file.

```json
// ...
  "cart": {
    "title": "My cart",
  },
```

Similarly, make changes to the remaining components requiring a page title.

Let's commit the new changes:

```bash
git add -A
git commit -m "Created HOC to add page title"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/6129a2069d2725eb4575c10f666ba291724f5560).
