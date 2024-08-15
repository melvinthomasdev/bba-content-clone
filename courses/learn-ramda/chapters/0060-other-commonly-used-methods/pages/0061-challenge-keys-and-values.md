Print the keys and values of the given `book` object.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const book = {
  id: 1,
  title: "A Game of Thrones",
  tags: ["fiction"],
  author: {
    firstName: "George",
    lastName: "Martin",
  }
};

const objectKeys = // Return the keys
const objectValues = // Return the values

console.log(objectKeys);
console.log(objectValues);
</code>
<solution>
const book = {
  id: 1,
  title: "A Game of Thrones",
  tags: ["fiction"],
  author: {
    firstName: "George",
    lastName: "Martin",
  }
};

const objectKeys = R.keys(book);
const objectValues = R.values(book);

console.log(objectKeys);
console.log(objectValues);
</solution>
</codeblock>
