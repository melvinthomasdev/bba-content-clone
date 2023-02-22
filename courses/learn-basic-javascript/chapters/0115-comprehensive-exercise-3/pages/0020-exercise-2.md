```
1. title = The Hobbit,
  author = J.R.R. Tolkien,
  already-read = true,
  is-available = false
2. title = The Hundred thousand kingdoms,
  author = N. K. Jemisin,
  already-read = false,
  is-available = true
3. title = Kalki = Avatar of Vishnu,
  author = Kevin Missal,
  already-read = true,
  is-available = false

4. title = Goosebumps,
  author = R. L. Stine,
  already-read = false,
  is-available = true

5.title = The Alchemist,
  author = Paulo Coelho,
  already-read = false,
  is-available = false
```

1. From the data-set given above, create an array of objects, each object describes a book and has properties for:
   - title (a string),
   - author (a string),
   - already-read (a boolean indicating if you read it yet).
   - is-available (a boolean indicating whether the book is available in the market)
2. For each book, log the book title and book author like so: `"The Hobbit" by J.R.R. Tolkien.`.
3. For each book, if you read it, log a string like 'You already read "The Hobbit" by J.R.R. Tolkien'
4. If you did not read it and it is available, log a string like 'You can read "The Hobbit" by J.R.R. Tolkien next as it is available.'
5. If you did not read it and it is not available, log a string like 'You have not read "The Lord of the Rings" by J.R.R. Tolkien and it is not available.'

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
</code>

<solution>
const bookList = [{
    "title": "The Hobbit",
    "author": "J.R.R. Tolkien",
    "already-read": true,
    "is-available": false
  },
  {
    "title": "The Hundred thousand kingdoms",
    "author": "N. K. Jemisin",
    "already-read": false,
    "is-available": true
  },
  {
    "title": "Kalki: Avatar of Vishnu",
    "author": "Kevin Missal",
    "already-read": true,
    "is-available": false
  },
  {
    "title": "Goosebumps",
    "author": "R. L. Stine",
    "already-read": false,
    "is-available": true
  },
  {
    "title": "The Alchemist",
    "author": "Paulo Coelho",
    "already-read": false,
    "is-available": false
  }
]

<!-- Using for..of loop -->
for (const book of bookList){
	console.log(`"${book.title}" by ${book.author}.`)

	if (book["already-read"]) {
		console.log(`You already read "${book.title}" by ${book.author}.`);
	} else if(!book["already-read"] && !book["is-available"]){
		console.log(`You have not read "${book.title}" by ${book.author} and it is not available.`);
	} else if(!book["already-read"] && book["is-available"]){
		console.log(`You can read "${book.title}" by ${book.author} next as it is available.`);
	} else {
		console.log(`You can read "${book.title}" by ${book.author}.`);
	}
}
</solution>
</codeblock>
