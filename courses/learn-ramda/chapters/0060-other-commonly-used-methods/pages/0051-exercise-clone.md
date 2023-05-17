Create a deep copy of the given book so that updating the properties on the new `book` object does not change the values of the old object.

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

const book2 = // Create a deep copy

console.log(book1 === book2);
console.log(book1.author === book2.author);
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

const book2 = R.clone(book1);

console.log(book1 === book2);
console.log(book1.author === book2.author);
</solution>
</codeblock>
