Declare a function to
extract the name of the book
and
the date borrowed by the user.
The details of the book
will be in the form of
an array of objects.

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

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const getBorrower = (booksRecord, borrower) => {
  // write your code here
}
</code>

<solution>
const getBorrower = (booksRecord, borrower) => {
  const borrowedBookDetails = booksRecord.find((bookRecord) => bookRecord.borrower === borrower);
  if (borrowedBookDetails) {
    const book = borrowedBookDetails.book;
    const date = borrowedBookDetails.date;
    return `${borrower} borrowed "${book}" on ${date}`;
  }
  return "No books borrowed";
}
</solution>

<testcases>
<caller>
console.log(getBorrower(borrowedBooks, userName));
</caller>
<testcase>
<i>
const borrowedBooks = [
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
const userName = "oliver_smith";
</i>
</testcase>
<testcase>
<i>
const borrowedBooks = [
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
const userName = "sam";
</i>
</testcase>
<testcase>
<i>
const borrowedBooks = [
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
const userName = "anna";
</i>
</testcase>
<testcase>
<i>
const borrowedBooks = [
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
const userName = "anna_smith";
</i>
</testcase>
</testcases>
</Editor>