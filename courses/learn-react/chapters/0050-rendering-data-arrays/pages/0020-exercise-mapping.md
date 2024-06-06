In the code snippet given below, the constant named `BOOKS` holds the details of some books, where each book has a `title` and `author`. The `Book` component displays the detail of a single book. Your task is to use the `map()` method to generate a list of books with their respective title and author.

The output should look like the image given below.

<image>array-mapping-exercise-output.png</image>

<codeblock language="reactjs" foldLines="1-22" type="exercise" testMode="fixedInput">
<code>
const BOOKS = [
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
  },
  {
    title: "1984",
    author: "George Orwell",
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
  },
];

const Books = () => (
  null // Remove this null and implement mapping logic here.
);

const Book = ({ title, author }) => (
  <div style={{ borderBottom: "1px solid black" }}>
    <p>Book title: {title}</p>
    <p>Author: {author}</p>
  </div>
);

export default Books;
</code>
<solution>
const BOOKS = [
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
  },
  {
    title: "1984",
    author: "George Orwell",
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
  },
];

const Books = () => (
  BOOKS.map(book => <Book {...book}  />)
);

const Book = ({ title, author }) => (
  <div style={{ borderBottom: "1px solid black" }}>
    <p>Book title: {title}</p>
    <p>Author: {author}</p>
  </div>
);

export default Books;
</solution>
</codeblock>
