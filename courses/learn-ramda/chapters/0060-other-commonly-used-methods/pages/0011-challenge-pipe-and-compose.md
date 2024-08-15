Use the pipe function to take the following `book` object as input and returns whether the title contains the word `of`. Note that the check has to be case-insensitive.

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

const bookTitleContainsOf = R.pipe() //Complete pipe function
console.log(bookTitleContainsOf(book));
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

const bookTitleContainsOf = R.pipe(R.prop("title"), R.toLower, R.includes("of"));
console.log(bookTitleContainsOf(book));
</solution>
</codeblock>
