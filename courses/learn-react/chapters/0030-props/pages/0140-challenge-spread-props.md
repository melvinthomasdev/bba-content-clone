Pass the properties of `bookDetails` object to `Book` component using spread props.

<codeblock language="reactjs" foldLines="11-24" type="exercise" testMode="fixedInput">
<code>
const App = () => {
  const bookDetails = {
    name: "Harry Potter and the Philosopher's Stone",
    author: "J. K. Rowling",
    price: 499,
  };

  return <Book />;
};

const Book = ({ name, author, price }) => (
  <div>
    <h1>Book</h1>
    <p>
      <b>Name:</b> {name}
    </p>
    <p>
      <b>Author:</b> {author}
    </p>
    <p>
      <b>Price:</b> ${price}
    </p>
  </div>
);

export default App;
</code>
<solution>
const App = () => {
  const bookDetails = {
    name: "Harry Potter and the Philosopher's Stone",
    author: "J. K. Rowling",
    price: 499,
  };

  return <Book {...bookDetails} />;
};

const Book = ({ name, author, price }) => (
  <div>
    <h1>Book</h1>
    <p>
      <b>Name:</b> {name}
    </p>
    <p>
      <b>Author:</b> {author}
    </p>
    <p>
      <b>Price:</b> ${price}
    </p>
  </div>
);

export default App;
</solution>
</codeblock>
