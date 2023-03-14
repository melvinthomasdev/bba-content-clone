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

1. From the data-set given above, create an array of objects, each object
   describes a book and has properties for:
   - title (a string),
   - author (a string),
   - already-read (a boolean indicating if you read it yet).
   - is-available (a boolean indicating whether the book is available in the
     market)
2. Update the given program such that it takes the data-set and for each book
   and logs the book title and book author like so:
   `"The Hobbit" by J.R.R. Tolkien.`.
3. For each book, if you read it, log a string like
   `You already read "The Hobbit" by J.R.R. Tolkien`.
4. If you did not read it and it is available, log a string like
   `You can read "The Hobbit" by J.R.R. Tolkien next as it is available.`
5. If you did not read it and it is not available, log a string like
   `You have not read "The Lord of the Rings" by J.R.R. Tolkien and it is not available.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const nextBook = () => {}
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
const nextBook = (bookArray) => {
	//Using for..of loop
	for (const book of bookList) {
		console.log(`"${book.title}" by ${book.author}.\n`);

    	if (book["already-read"]) {
    		console.log(`You already read "${book.title}" by ${book.author}.\n`);
    	} else if (!book["already-read"] && !book["is-available"]) {
    		console.log(`You have not read "${book.title}" by ${book.author} and it is not available.\n`);
    	} else {
    		console.log(`You can read "${book.title}" by ${book.author} next as it is available.\n`);
    	};
    }

}

</solution>
<testcases>
<caller>
nextBook(newBookList)
</caller>
<testcase>
<i>
const newBookList = [{
		"title": "The Haunted Key",
		"author": "Mike Ford",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "Keepers of the Kalachakra",
		"author": "Ashwin Sanghi",
		"already-read": false,
		"is-available": false
	},
	{
		"title": "The Enchanted Castle",
		"author": "E. Nesbit",
		"already-read": true,
		"is-available": false
	},
	{
		"title": "Witch's revenge",
		"author": "Christopher Pike",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "Annihilation",
		"author": "Jeff VanderMeer",
		"already-read": false,
		"is-available": true
	}
]
</i>
</testcase>
<testcase>
<i>
const newBookList = [{
		"title": "Authority",
		"author": "Jeff VanderMeer",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "The Broken Kingdoms",
		"author": "N. K. Jemisin",
		"already-read": true,
		"is-available": true
	},
	{
		"title": "Metamorphosis",
		"author": "Franz Kafka",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "Eye of Brahma",
		"author": "Kevin Missal",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "Hiranyakashyap",
		"author": "Kevin Missal",
		"already-read": false,
		"is-available": false
	}
]
</i>
</testcase>
<testcase>
<i>
const newBookList = [{
		"title": "The Son of Ganga",
		"author": "Dinesh Veera",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "Dopamine Detox",
		"author": "Thibaut Meurisse",
		"already-read": false,
		"is-available": false
	},
	{
		"title": "The Alexander Secret",
		"author": "Christopher C Doyle",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "The Canterville Ghost",
		"author": "Oscar Wilde",
		"already-read": false,
		"is-available": true
	},
	{
		"title": "CHAIN LETTER",
		"author": "Christopher Pike",
		"already-read": false,
		"is-available": true
	}
]
</i>
</testcase>
</testcases>
</codeblock>
