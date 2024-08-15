In the following `book` object, update the `author.booksPublished` key to increment the count of published books by 1.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const book = {
  id: 1,
  title: "A Game of Thrones",
  tags: ["fiction", "fantasy"],
  author: {
    firstName: "George",
    lastName: "Martin",
    booksPublished: 5,
  }
};

const updatedBook = //Complete the code using modifyPath
console.log(updatedBook);
</code>
<solution>
const book = {
  id: 1,
  title: "A Game of Thrones",
  tags: ["fiction", "fantasy"],
  author: {
    firstName: "George",
    lastName: "Martin",
    booksPublished: 5,
  }
};

const updatedBook = R.modifyPath(["author", "booksPublished"], R.inc, book);
console.log(updatedBook);
</solution>
</codeblock>
