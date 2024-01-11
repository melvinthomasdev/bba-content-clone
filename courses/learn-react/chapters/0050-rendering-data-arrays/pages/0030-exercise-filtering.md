In the code snippet given below, the constant named `BOOKS` holds the details of some books, where each book has a `title` and `author`. Your task is to display the list of books written by "Jane Austen" only.

The output should look like the image given below.

<image>filtering-exercise-output.png</image>

<codeblock language="reactjs" foldLines="1-22" type="exercise" testMode="fixedInput">
<code>
const BOOKS = [
    {
      title: "The Catcher in the Rye",
      author: "J.D. Salinger",
    },
    {
      title: "Pride and Prejudice",
      author: "Jane Austen",
    },
    {
      title: "1984",
      author: "George Orwell",
    },
    {
      title: "Mansfield Park",
      author: "Jane Austen",
    },
    {
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
    },
];

const Books = () => (
  null // Remove this null and implement your logic here.
);

export default Books;
</code>
<solution>
const BOOKS = [
  { title: "The Catcher in the Rye", author: "J.D. Salinger" },
  { title: "Pride and Prejudice", author: "Jane Austen" },
  { title: "1984", author: "George Orwell" },
  { title: "Mansfield Park", author: "Jane Austen" },
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald" },
];

const Books = () =>
  BOOKS.filter(({ author }) => author === "Jane Austen").map(book => (
    <Book {...book} />
  ));

const Book = ({ title, author }) => (
  <div
    style={{
      border: "1px solid blue",
      borderRadius: 5,
      padding: 8,
      marginBottom: 5,
      backgroundColor: "azure",
    }}
  >
    <p>Book title: {title}</p>
    <p>Author: {author}</p>
  </div>
);

export default Books;
</solution>
</codeblock>
