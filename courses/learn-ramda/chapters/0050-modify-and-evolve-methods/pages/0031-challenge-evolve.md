In the given `book` object, introduce the following changes:
```
id: increment by one, // 2
tags: add "secondary world" to the list, // ["fiction", "fantasy", "secondary world"]
author.firstName: Add the salutation "Mr", // "Mr George"
author.lastName: Replace value with "RRM", // "RRM"
```

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

const updatedBook = //Complete the code using evolve
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

const updatedBook = R.evolve(
  {
    id: R.inc,
    tags: R.append("secondary world"),
    author: {
      firstName: name => R.concat("Mr ", name),
      lastName: R.always("RRM"),
    }
  },
  book
);
console.log(updatedBook);
</solution>
</codeblock>
