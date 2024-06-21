At the beginning of this chapter, we learned about mapping in React. Now, let's write a small piece of code that uses mapping.

<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
const fruits = ["Apple", "Mango", "Grapes"];

const Fruits = () => (
  fruits.map(fruit => <li>{fruit}</li>)
);

export default Fruits;
</code>
</codeblock>

In this example, we are rendering a list of fruits using the map method.

In the console, you will find a warning that says `Each child in a list should have a unique "key" prop`.

In React, when we use the map method to generate an array of JSX, we need to provide a `key` prop to the top level element within the map method. This key is like a label that tells React which specific item from the array each component represents.

- A key can be a `string` or a `number` that uniquely identifies an item among the array of items that are being rendered. When we pass a `number` as a key, under the hood it gets converted to a `string`.
- JSX elements directly inside a `map()` method call always need keys.
- If you don’t specify a key at all, React will use item index in the array as its key.

Let's use `keys` to resolve the above-mentioned warning.
<codeblock language="reactjs" type="lesson" showConsole="true">
<code>
// Added an unique `id` key in books objects, so that it can be used as keys.
const BOOKS = [
  {
    id: 1,
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
  },
  {
    id: 2,
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
  },
  {
    id: 3,
    title: "1984",
    author: "George Orwell",
  },
  {
    id: 4,
    title: "Pride and Prejudice",
    author: "Jane Austen",
  },
  {
    id: 5,
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
  },
];

const Books = () => (
  BOOKS.map(book => <Book {...book} key={book.id} />)
);

const Book = ({ title, author }) => (
  <div
    style={{
      border: "1px solid #ccc",
      borderRadius: 5,
      padding: 8,
      marginBottom: 5,
      backgroundColor: "#f9f9f9",
    }}
  >
    <p>Book title: {title}</p>
    <p>Author: {author}</p>
  </div>
);

export default Books;
</code>
</codeblock>

Did you notice that on line number `31` we have added the `key` prop? Now check the console. You won't find the `Each child in a list should have a unique "key" prop` warning for the `Books` component.

## Importance of passing keys

In our earlier lessons, we learned that React has a Virtual DOM and re-renders only the new changes. To identify these new changes, React compares the previous Virtual DOM with the current Virtual DOM. Similarly, when we render a list of items, React compares the previous version of the list with the current version of the list using keys. This allows React to efficiently identify and re-render only the new changes.

Passing a key becomes important if the list can get mutated due to the insertion, deletion, or sorting of items. If the list changes, React knows which specific component should be re-rendered for the new change because of the unique key.

To understand this concept let's consider the following two cases:

Case 1: We have an array of list items `<li>`, and in that array, we have two list items with the data, "Apple" and "Mango".

```jsx
const fruits = [
  { id: 1, name: "Apple" },
  { id: 2, name: "Mango" }
];

const fruitsItemList = fruits.map(fruit => (
  <li key={fruit.id}>{fruit.name}</li>
));
```

The key association with list items `<li>` will be created as follows:

```
  ---------------------
|  List Item   -   Key  |
| --------------------- |
|    Apple     -    1   |
|    Mango     -    2   |
  ---------------------
```

Now we need to add an item at end of the list, such as `{ id: 3, name: "Banana" }`.

```
  ---------------------
|  List Item   -   Key  |
| --------------------- |
|    Apple     -    1   |
|    Mango     -    2   |
|    Banana    -    3   |
  ---------------------
```

React will iterate over these two lists at the same time and generate a mutation whenever there is a difference. In our case, React will match the first two items in both lists and see no difference. But when it comes to the third item, it will find a difference and it will add a third item to the DOM tree.

Case 2: Lets consider the same initial list but this time we need to add the third item i.e. `{ id: 3, name: "Banana" }` at the beginning of the list.

```
  ---------------------            ---------------------
|  List Item   -   Key  |        |  List Item   -   Key  |
| --------------------- |        | --------------------- |
|    Apple     -    1   |        |    Banana    -   3    |
|    Mango     -    2   |        |    Apple     -   1    |
  ---------------------          |    Mango     -   2    |
                                   ---------------------
```

Now React will make a decision that the item with key 3 is the new one and the item with keys 1 and 2 have just been moved. So React will simply add a new item at the beginning of the DOM tree.

## Rules of keys

- Keys must be unique among siblings. However, it’s okay to use the same keys for JSX nodes in different arrays.

- Keys must not change because that defeats their purpose! Don’t generate them while rendering.

## Choosing suitable keys

- If the data is coming from the database, we can use the database keys/IDs as keys, which are unique by nature. For example, suppose we have a table called `users` in a relational database, and each user has an `id` column that is the primary key of the table. This means that no two users can have the same `id` value, ensuring each user can be uniquely identified. Therefore, we can confidently use the `id` as a key.

- If the data is generated and persisted locally, we can add an `id` field and use an increment counter when creating items and use the `id` field as a key. For example, if we have a list of `users` stored in a local file, we can add an `id` field for each user and assign it a value that increases by one every time we add a new user. This way, we can ensure that each user has a unique `id` that we can use as a key.

```jsx {3-3, 7-7}
const USERS = [
  {
    id: 1,
    name: "Oliver"
  },
  {
    id: 2,
    name: "George"
  }
];
```

## Index as a key is an anti-pattern

Using indexes for keys in React is not recommended if the order of items may change. This can have a negative impact on performance and may cause problems with component state. We will delve deeper into this concept in the upcoming chapters.

## Important points

- Do not generate keys on the fly, like with `key={Math.random()}`. This will cause keys to never match up between renders, lead to all your components and DOM being recreated every time.

- Components won't receive the `key` as a prop. If you attempt to access the value of the `key` within the component, as demonstrated in the below example, its value will be `undefined`, and it will also trigger a warning in the browser console.

  ```jsx {3-3}
  const User = ({ key, name }) => (
    <div>
      <p>User's id is {key}.</p>
      <p>User's name is {name}.</p>
    </div>
  );

  const App = () => <User key={1} name="Oliver" />;
  ```

  So, if you need to access the same value as the key for some other purpose inside the component, you should pass it as a different prop with a distinct name.

- If we are using fragments as wrappers, we need to use the long form to add keys, as demonstrated in the example below:

  ```jsx {3-3, 6-6}
  <div>
    {users.map(user => (
      <Fragment key={user.id}>
        <p>User's first name is {user.firstName}</p>
        <p>User's last name is {user.lastName}</p>
      </Fragment>
    ))}
  </div>
  ```
