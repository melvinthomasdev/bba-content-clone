Consider the following array of `books`. Create a new array that only consists of the book titles.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const books = [
  {
    id: 1,
    title: "A Game of Thrones",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 2,
    title: "A Clash of Kings",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 3,
    title: "A Storm of Swords",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 4,
    title: "A Feast for Crows",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 5,
    title: "A Dance with Dragons",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
];

const bookTitles = //Complete this to get an array of titles

console.log(bookTitles);
</code>
<solution>
const books = [
  {
    id: 1,
    title: "A Game of Thrones",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 2,
    title: "A Clash of Kings",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 3,
    title: "A Storm of Swords",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 4,
    title: "A Feast for Crows",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
  {
    id: 5,
    title: "A Dance with Dragons",
    tags: ["fiction"],
    author: {
      firstName: "George",
      lastName: "Martin",
    }
  },
];

const bookTitles = R.pluck("title", books);

console.log(bookTitles);
</solution>
</codeblock>
