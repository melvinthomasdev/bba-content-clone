React provides a special prop that you can use to denote content between the
start and ending tags.

This is usually seen in HTML elements as:

```html
<p>Children of p</p>

<div>
  <p>This is children content of div and p tags</p>
</div>
```

In React, you can achieve the same using `props.children`:

```javascript
<Button>
  <i>icon</i>
  <span>Content</span>
</Button>
```

Inside `Button` component, you can access children as:

```javascript
function Button({ children }) {
  return <button>{children}</button>;
}
```

Note that `children` as a prop does not need to be passed explicitly. React
Suggested change passes whatever content you have passed inside special
`children` prop. Children automatically populates and passes the `children` prop
with whatever JSX you have wrapped under the component as children. This prop is
fit for passing in large values which can be substituted with any React element.
React also provides a dedicated API for dealing with `children`.

**Advantages**

- Allows for more composition to avoid
  [prop drilling](https://kentcdodds.com/blog/prop-drilling).

```javascript
const currentUser = () => (
  <Permissions>
    <Navbar>
      <Left />
      <Right>
        <Profile>
          {/* By using children prop we have avoided passing currentUser to components in multiple levels */}
          <img src={currentUser.image} alt="" />
        </Profile>
      </Right>
    </Navbar>
  </Permissions>
);
```

- Children opens up more patterns like Compound Components. Refer to the
  [Compound React components chapter](/react-best-practices/compound-react-components)
  for more info on compound components and how to use them.

## When to create child components

Child components should be created when you want a more `specific` component to
render a `generic` component. For example, take a look at the following code:

```jsx
import React from "react";

const Products = ({ productList, buyProduct }) => (
  <ul>
    {productList.map(({ item, category, price }) => (
      <li>
        <h2>{item}</h2>
        <p>{category}</p>
        <p>{price}</p>
        <button type="submit" onClick={buyProduct}>
          Buy Now
        </button>
      </li>
    ))}
  </ul>
);
```

In the above component, `Products` component renders a products page which
contains a list of products. The list could contain a wide variety of products
ranging from a book to an electrical appliance. Think of it like this, a product
is like an entity with traits like `item`, `price` & `category`.

In such cases, it is considered a good practice to create a separate child
component for the entity and then pass the traits as props to that component. In
this case, the entity is a `Product`. We could create a generic component called
`Product` which will render the UI for a product based on the props it receives
like so:

```jsx
import React from "react";

const Product = ({ item, price, category, onSubmit }) => (
  <div>
    <h2>{item}</h2>
    <p>{category}</p>
    <p>{price}</p>
    <button type="submit" onClick={onSubmit}>
      Buy Now
    </button>
  </div>
);

const Products = ({ productList, buyProduct }) =>
  productList.map(({ slug, item, category, price }) => (
    <Product
      item={item}
      category={category}
      price={price}
      onSubmit={() => buyProduct(slug)}
    />
  ));
```

As you can see the code looks much cleaner and easier to read now. With these
changes we have achieved the following goals:

- Increased code reusability. The `Product` component can be reused not only in
  the `Products` list page but in other places where a product needs to be
  rendered.

- With extracting the `Product` UI to a child component, we have created a
  separation of concern. Now the `Products` page renders a list of products and
  the `Product` component renders a product UI. Now someone going through the
  code can easily tell what each component is meant for.

- This will lead to a more readable and maintainable code.

This development pattern is known as React composition and it is based on
React's original component model where we build components from other components
using explicit defined props or the implicit children prop.

### References

- [Children in JSX - React docs](https://reactjs.org/docs/jsx-in-depth.html#children-in-jsx)
- [Children API - React docs](https://reactjs.org/docs/react-api.html#reactchildren)
- [Compound Components - Kent C Dodds](https://kentcdodds.com/blog/compound-components-with-react-hooks/)
- [Using composition to avoid prop drilling - React Training](https://www.youtube.com/watch?v=3XaXKiXtNjw)
