If the details of a book are provided in the below format:

|Key | Value |
|--|--|
|title |Malgudi Days |
|author |R. K. Narayan |
|"alreadyRead" |true |
|isAvailable |true|

Write code that takes in these book details to perform the following actions:

* For each book, use the format, `[Book Name] by [Author Name]` and print the book title and book author. 

* You need to print these additional statements to the console based on the provided conditions:

	* If the user has read the book: `You have already read [Book Name] by [Author Name].`

	* If the user has not yet read the book and it is available.": `Since [Book Name] by [Author Name] is available, you can read it next.`

	* If the user has not yet read the book, but it is not available: `Currently, $[Book Name] by [Author Name] is unavailable. You can plan to read it next once it becomes available.`

Make sure your code is flexible enough to work with any value of the `bookDetails` variable that meets these requirements.

For example:
```js
const bookDetails = {
	"title": "Malgudi Days",
	"author": "R. K. Narayan",
	"alreadyRead": true,
	"isAvailable": true
}

Output:
"Malgudi Days by R. K. Narayan"
"You have already read Malgudi Days by R. K. Narayan."
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findTheNextBook = () => {
	// Write your code here
}
</code>

<solution>
const findTheNextBook = (bookDetails) => {
	console.log(`${bookDetails.title} by ${bookDetails.author}`);

	if (bookDetails.alreadyRead) {
		console.log(`You have already read ${bookDetails.title} by ${bookDetails.author}.`);
	} else {
		if (!bookDetails.isAvailable) {
			console.log(`Currently, ${bookDetails.title} by ${bookDetails.author} is unavailable. You can plan to read it next once it becomes available.`);
		} else {
			console.log(`Since ${bookDetails.title} by ${bookDetails.author} is available, you can read it next.`);
		}
	}
}
</solution>
<testcases>
<caller>
findTheNextBook(bookDetails);
</caller>
<testcase>
<i>
const bookDetails = {
	"title": "Malgudi Days",
	"author": "R. K. Narayan",
	"alreadyRead": true,
	"isAvailable": true
}
</i>
</testcase>
<testcase>
<i>
const bookDetails = {
	"title": "Wings of Fire",
	"author": "A. P. J. Abdul Kalam",
	"alreadyRead": false,
	"isAvailable": true
}
</i>
</testcase>
<testcase>
<i>
const bookDetails = {
	"title": "Harry Potter",
	"author": "J.K. Rowling",
	"alreadyRead": false,
	"isAvailable": true
}
</i>
</testcase>
<testcase>
<i>
const bookDetails = {
	"title": "Sherlock Holmes",
	"author": "Arthur Conan Doyle",
	"alreadyRead": false,
	"isAvailable": false
}
</i>
</testcase>
</testcases>
</codeblock>
