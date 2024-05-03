The function **checkBookAvailability** accepts an array of book
objects, referred to as **inventory**, and a specified book title,
denoted as **requestedTitle**. Each book object contains properties
**title** and **copiesAvailable**.
The function checks whether the requested book is present
and available in the inventory.

For example, if the book **The Namesake** is available in the
inventory, the function should return,
**"The book 'The Namesake' is available in stock."**

If the book is not available in the inventory or the number
of available copies is 0, it returns a message indicating
that the book is currently out of stock.
For example, if the book **The White Tiger** is not in stock,
the function should return
**"Sorry, the book 'The White Tiger' is currently out of stock."**

```js
Input:
inventory = [
  { title: "The Namesake", copiesAvailable: 15 },
  { title: "The Guide", copiesAvailable: 7 },
  { title: "The God of Small Things", copiesAvailable: 12 },
  { title: "The Great Gatsby", copiesAvailable: 0 },
  { title: "To Kill a Mockingbird", copiesAvailable: 3 },
  { title: "Harry Potter and the Philosopher's Stone", copiesAvailable: 12 },
]
requestedTitle = "The Godfather"

Output: "Sorry, the book 'The Godfather' is currently out of stock."
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function checkBookAvailability(inventory, requestedTitle) {
  let availableCopies;
  // Your code goes here

}
</code>

<solution>
function checkBookAvailability(inventory, requestedTitle) {
  let availableCopies = 0;

  inventory.forEach(book => {
    if (book.title === requestedTitle) {
      availableCopies = book.copiesAvailable;
    }
  });

  return availableCopies > 0 ?
    `The book "${requestedTitle}" is available in the stock.` :
    `Sorry, the book "${requestedTitle}" is currently out of stock.`;
}
</solution>

<testcases>
<caller>
console.log(checkBookAvailability(inventory, requestedTitle));
</caller>
<testcase>
<i>
const inventory = [
  { title: "The Namesake", copiesAvailable: 15 },
  { title: "The Guide", copiesAvailable: 7 },
  { title: "The God of Small Things", copiesAvailable: 12 },
  { title: "The Great Gatsby", copiesAvailable: 0 },
  { title: "To Kill a Mockingbird", copiesAvailable: 3 },
  { title: "Harry Potter and the Philosopher's Stone", copiesAvailable: 12 },
];
const requestedTitle = "The Guide";
</i>
</testcase>
<testcase>
<i>
const inventory = [
  { title: "The Namesake", copiesAvailable: 15 },
  { title: "The Guide", copiesAvailable: 7 },
  { title: "The God of Small Things", copiesAvailable: 12 },
  { title: "The Great Gatsby", copiesAvailable: 0 },
  { title: "To Kill a Mockingbird", copiesAvailable: 3 },
  { title: "Harry Potter and the Philosopher's Stone", copiesAvailable: 12 },
];
const requestedTitle = "The Great Gatsby";
</i>
</testcase>
<testcase>
<i>
const inventory = [
  { title: "The Namesake", copiesAvailable: 15 },
  { title: "The Guide", copiesAvailable: 7 },
  { title: "The God of Small Things", copiesAvailable: 12 },
  { title: "The Great Gatsby", copiesAvailable: 0 },
  { title: "To Kill a Mockingbird", copiesAvailable: 3 },
  { title: "Harry Potter and the Philosopher's Stone", copiesAvailable: 12 },
];
const requestedTitle = "To Kill a Mockingbird";
</i>
</testcase>
<testcase>
<i>
const inventory = [
  { title: "The Namesake", copiesAvailable: 15 },
  { title: "The Guide", copiesAvailable: 7 },
  { title: "The God of Small Things", copiesAvailable: 12 },
  { title: "The Great Gatsby", copiesAvailable: 0 },
  { title: "To Kill a Mockingbird", copiesAvailable: 3 },
  { title: "Harry Potter and the Philosopher's Stone", copiesAvailable: 12 },
];
const requestedTitle = "The Shadow Lines";
</i>
</testcase>
</testcases>
</codeblock>
