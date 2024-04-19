Declare a function to extract the name of the book and the date borrowed by the user. The details of the book will be in the form of an array of objects.

1. If the user has borrowed the book,
return the name of the book
and
the date.

2. Each object will contain
the `borrower` field.

3. Return a string
that looks like
`"Borrower Name" borrowed "book name" on "date"`.

4. If the user has not borrowed any book,
return the string `No books borrowed`.

For example:
```js
Input:
const booksRecord = [
  { book: "The Great Gatsby", borrower: "Sam", date: "2024-04-15" },
  { book: "To Kill a Mockingbird", borrower: "Eve", date: "2024-04-10" },
  { book: "1984", borrower: "Linh", date: "2024-04-20" }
];
const borrower = "Carlos";

Output:
"No books borrowed"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getBorrower = ({ booksRecord, borrower }) => {
  // write your code here
}
</code>

<solution>
const getBorrower = ({ booksRecord, borrower }) => {
  const borrowedBookDetails = booksRecord.find((bookRecord) => bookRecord.borrower === borrower);
  if (!borrowedBookDetails)
    return "No books borrowed";

  const book = borrowedBookDetails.book;
  const date = borrowedBookDetails.date;
  return `"${borrower}" borrowed "${book}" on "${date}"`;
}
</solution>

<testcases>
<caller>
console.log(getBorrower({ booksRecord, borrower }));
</caller>
<testcase>
<i>
const booksRecord = [
    {
      book: "Invisible Man",
      borrower: "oliver_smith",
      date: "10-May-2021",
    },
    {
      book: "The Boy Who Harnessed the Wind",
      borrower: "anna_smith",
      date: "16-March-2021",
    },
    {
      book: "The Book Thief",
      borrower: "sam_smith",
      date: "21-April-2020",
    }
  ];
const borrower = "oliver_smith";
</i>
</testcase>
<testcase>
<i>
const booksRecord = [
    {
      book: "Invisible Man",
      borrower: "oliver_smith",
      date: "10-May-2021",
    },
    {
      book: "The Boy Who Harnessed the Wind",
      borrower: "anna_smith",
      date: "16-March-2021",
    },
    {
      book: "The Book Thief",
      borrower: "sam_smith",
      date: "21-April-2020",
    }
  ];
const borrower = "sam";
</i>
</testcase>
<testcase>
<i>
const booksRecord = [
    {
      book: "Invisible Man",
      borrower: "oliver_smith",
      date: "10-May-2021",
    },
    {
      book: "The Boy Who Harnessed the Wind",
      borrower: "anna_smith",
      date: "16-March-2021",
    },
    {
      book: "The Book Thief",
      borrower: "sam_smith",
      date: "21-April-2020",
    }
  ];
const borrower = "anna";
</i>
</testcase>
<testcase>
<i>
const booksRecord = [
    {
      book: "Invisible Man",
      borrower: "oliver_smith",
      date: "10-May-2021",
    },
    {
      book: "The Boy Who Harnessed the Wind",
      borrower: "anna_smith",
      date: "16-March-2021",
    },
    {
      book: "The Book Thief",
      borrower: "sam_smith",
      date: "21-April-2020",
    }
  ];
const borrower = "anna_smith";
</i>
</testcase>
</testcases>
</codeblock>
