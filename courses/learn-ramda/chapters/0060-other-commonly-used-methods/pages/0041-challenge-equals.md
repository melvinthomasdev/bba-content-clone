In the following `book` object, if the author value is the same as `currentAuthor`, add a key called `publishedByCurrent` with the value `true`.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const book1 = {
  id: 1,
  title: "A Game of Thrones",
  tags: ["fiction"],
  author: {
    firstName: "George",
    lastName: "Martin",
  }
};

const book2 = {
  id: 2,
  title: "Gardens of The Moon",
  tags: ["fiction"],
  author: {
    firstName: "Steven",
    lastName: "Erikson",
  }
};

const currentAuthor = {
  firstName: "George",
  lastName: "Martin",
};

const addPublishedByToBook = book => //Complete this function

console.log(addPublishedByToBook(book1));
console.log(addPublishedByToBook(book2));
</code>
<solution>
const book1 = {
  id: 1,
  title: "A Game of Thrones",
  tags: ["fiction"],
  author: {
    firstName: "George",
    lastName: "Martin",
  }
};

const book2 = {
  id: 2,
  title: "Gardens of The Moon",
  tags: ["fiction"],
  author: {
    firstName: "Steven",
    lastName: "Erikson",
  }
};

const currentAuthor = {
  firstName: "George",
  lastName: "Martin",
};

const addPublishedByToBook = book =>
  R.equals(book.author, currentAuthor)
  ? R.assoc("publishedByCurrent", true, book)
  : book

const newBook1 = addPublishedByToBook(book1)
const newBook2 = addPublishedByToBook(book2)

console.log(newBook1);
console.log(newBook2);
</solution>
</codeblock>
