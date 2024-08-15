Add a prop with the name `details` to the Book component and display the details of the book. Here `details` is an object which includes the title, author and genre. Pass the following details to the Book component.

|         **Key**          |             **Value**                     |
|--------------------------|-------------------------------------------|
|          title           | Harry Potter and the Philosopher's Stone  |
|          author          | J. K. Rowling                             |
|          genre           | Fantasy                                   |


<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Book = () => (
  <div>
    <h2>{replace with title}</h2>
    <p>Author: {replace with author name}</p>
    <p>Genre: {replace with genre}</p>
  </div>
);

const App = () => (
  <div>
    <h1>Book Recommendation</h1>
    <Book />
  </div>
);

export default App;
</code>
<solution>
const Book = ({ details }) => (
  <div>
    <h2>{details.title}</h2>
    <p>Author: {details.author}</p>
    <p>Genre: {details.genre}</p>
  </div>
);

const App = () => (
  <div>
    <h1>Book Recommendation</h1>
    <Book
      details={{
        title: "Harry Potter and the Philosopher's Stone",
        author: "J. K. Rowling",
        genre: "Fantasy",
      }}
    />
  </div>
);

export default App;
</solution>
</codeblock>
