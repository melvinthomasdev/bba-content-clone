Finish the method definition below.

The parameter `books_record` is an array of hashes, each of which contains three fields, `book`, `borrower` and `date`.


Given a `books_record` array and a `borrower` string, the method should return a string like `<Borrower Name> borrowed <book name> on <date>`, if the `borrower` has borrowed a book. If not, the function should return `No books borrowed`.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def get_borrower(books_record, borrower)
  # write your code here
end
</code>

<solution>
def get_borrower(books_record, borrower)
  borrowed_book_details = books_record.find { |book_record| book_record["borrower"] == borrower }
  return "No books borrowed" if borrowed_book_details.nil?

  book = borrowed_book_details["book"]
  date = borrowed_book_details["date"]
  return "#{borrower} borrowed '#{book}' on #{date}"
end
</solution>

<testcases>
<caller>
puts get_borrower(borrowed_books, user_name)
</caller>
<testcase>
<i>
borrowed_books = [
  {
    "book"=> "Invisible Man",
    "borrower"=> "oliver_smith",
    "date"=> "10-May-2021",
  },
  {
    "book"=> "The Boy Who Harnessed the Wind",
    "borrower"=> "anna_smith",
    "date"=> "16-March-2021",
  },
  {
    "book"=> "The Book Thief",
    "borrower"=> "sam_smith",
    "date"=> "21-April-2020",
  }
]
user_name = "oliver_smith"
</i>
</testcase>
<testcase>
<i>
borrowed_books = [
  {
    "book"=> "Invisible Man",
    "borrower"=> "oliver_smith",
    "date"=> "10-May-2021",
  },
  {
    "book"=> "The Boy Who Harnessed the Wind",
    "borrower"=> "anna_smith",
    "date"=> "16-March-2021",
  },
  {
    "book"=> "The Book Thief",
    "borrower"=> "sam_smith",
    "date"=> "21-April-2020",
  }
]
user_name = "sam"
</i>
</testcase>
<testcase>
<i>
borrowed_books = [
  {
    "book"=> "Invisible Man",
    "borrower"=> "oliver_smith",
    "date"=> "10-May-2021",
  },
  {
    "book"=> "The Boy Who Harnessed the Wind",
    "borrower"=> "anna_smith",
    "date"=> "16-March-2021",
  },
  {
    "book"=> "The Book Thief",
    "borrower"=> "sam_smith",
    "date"=> "21-April-2020",
  }
]
user_name = "anna"
</i>
</testcase>
<testcase>
<i>
borrowed_books = [
  {
    "book"=> "Invisible Man",
    "borrower"=> "oliver_smith",
    "date"=> "10-May-2021",
  },
  {
    "book"=> "The Boy Who Harnessed the Wind",
    "borrower"=> "anna_smith",
    "date"=> "16-March-2021",
  },
  {
    "book"=> "The Book Thief",
    "borrower"=> "sam_smith",
    "date"=> "21-April-2020",
  }
]
user_name = "anna_smith"
</i>
</testcase>
</testcases>
</codeblock>