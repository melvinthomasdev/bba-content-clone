In the following `book` object, update the `tags` key to add the tag `fantasy`.

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

const updatedBook = //Complete the code using modify
console.log(updatedBook);
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

const updatedBook = R.modify("tags", R.append("fantasy"), book);
console.log(updatedBook);
</solution>
</codeblock>
