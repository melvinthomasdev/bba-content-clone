Here is a code snippet from the previous chapter:

```jsx
if (isFavorite) {
  return <li>{name} ⭐</li>;
}

return <li>{name}</li>;
```

If you closely look at the above code, you can see that line 2 and line 5 are almost similar.
Consider a case where we need to change the `li` tag to some other tag like `div`. Or a scenario in which we rename the prop `name`. In both cases, we may need to update lines 2 and 5, which is against the DRY (Don't repeat yourself) principle.

Here is where the ternary operator (? :) becomes a powerful tool. It enables us to write more concise and readable code by minimizing repetition and improving code efficiency.

So using ternary operator we can simplify the above code snippet as follows:

```jsx
return <li>{isFavorite ? `${name}  ⭐️` : name}</li>;
```

See the updated example using ternary operator:

<codeblock language="reactjs" type="lesson">
const Book = ({ isFavorite, name }) => (
  <li>{isFavorite ? `${name}  ⭐️` : name}</li>
);

const BookList = () => (
<ul>
  <Book isFavorite name="Psychology of Money" />
  <Book name="Rich dad, poor dad" />
</ul>
);

export default BookList;
</codeblock>

Ternary operators are preferred over **if/else** in the following situations:

- We're initializing a variable conditionally or working out which value to use.
- We have a simple condition and want to render one of two possible JSX expressions.
- The condition and the resulting JSX expressions are concise and can be easily read in a single line.

The ternary operator allows us to be more concise and compact.

## Being mindful of ternary operator usage

If our conditional statement involves complex conditions or multiple branches, using nested ternary operators can make the code harder to read and maintain. In these situations, it is often more appropriate to use **if/else** statements.

Consider the following example:

```jsx
const BookDetails = ({ name, discount, quantity }) => {
  if (name) {
    if (discount > 0 && quantity > 0) {
      return (
        <p>
          {name} is available at {discount * 100}% offer.
        </p>
      );
    } else if (quantity === 0) {
      return <p>{name} is out of stock</p>;
    } else {
      return <p>{name} does not have a discount at the moment.</p>;
    }
  } else {
    return <p>Book should have a name.</p>;
  }
};
```

Here we are trying to output a message based on the values of `name`, `discount` & `quantity`. The same code can be written using ternary more compactly.

```jsx
const BookDetails = ({ name, discount, quantity }) =>
  name ? (
    discount > 0 && quantity > 0 ? (
      <p>
        {name} is available at {discount * 100}% offer.
      </p>
    ) : quantity === 0 ? (
      <p>{name} is out of stock.</p>
    ) : (
      <p>{name} does not have a discount at the moment.</p>
    )
  ) : (
    <p>Book should have a name.</p>
  );
```

However, the nested **if/else** statements provide better readability and flexibility in handling complex conditions and multiple branches. Therefore, in scenarios like this, using **if/else** is preferred over the **ternary** operator to enhance readability.

## Early returns

At BigBinary, a situation where using **if/else** is preferred over ternary is to achieve early returns. A perfect example of this scenario is when we need to render a `PageLoader` component.

```jsx
const Book = ({ name, isFavorite }) => (
  <li>{isFavorite ? `${name}  ⭐️` : name}</li>
);

const BookList = ({ isLoading }) => {
  if (isLoading) return <PageLoader />;

  return (
    <ul>
      <Book isFavorite name="Psychology of Money" />
      <Book name="Rich dad, poor dad" />
    </ul>
  );
};

export default BookList;
```

In the above code snippet, if `isLoading` is true, we immediately render the `PageLoader`, allowing for an early return from the `BookList` component. This early return pattern enhances code readability and reduces nested structures, making the code more concise and easier to maintain.
