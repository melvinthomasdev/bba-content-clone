The `bookDetails` variable is an object that contains different details of a book, like `title`, `author` and user specific details like `alreadyRead` and `isAvailable`. The `bookDetails` variable will have a different value each time the code is executed.

* For each book, write a code that logs to the console the book title and book author in the format:
   `[Book Name] by [Author Name]`.

* Log to the console more statements, based on the given conditions:

	* If the user has read it: `You have already read [Book Name] by [Author Name]`.
 
	* If the user has not yet read it and it is available.": `Since [Book Name] by [Author Name] is available, you can read it next`

	* If the user has not yet read it, but it is not available: `Currently, $[Book Name] by [Author Name] is unavailable. You can plan to read it next once it becomes available.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findTheNextBook = () => {
	// Write your code here
}
</code>

<solution>
const findTheNextBook = (bookDetails) => {
	console.log(`${bookDetails.title} by ${bookDetails.author}.`);
	if (bookDetails.alreadyRead) {
		console.log(`You have already read ${bookDetails.title} by ${bookDetails.author}.`);
	} else {
		if (!bookDetails.isAvailable) {
			console.log(`Currently, ${bookDetails.title} by ${bookDetails.author} is unavailable. You can plan to read it next once it becomes available.`);
		} else {
			console.log(`Since ${bookDetails.title} by ${bookDetails.author} is available, you can read it next`);
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
	alreadyRead: true,
	"isAvailable": true
}
</i>
</testcase>
<testcase>
<i>
const bookDetails = {
	"title": "Wings of Fire",
	"author": "A. P. J. Abdul Kalam",
	alreadyRead: false,
	"isAvailable": true
}
</i>
</testcase>
<testcase>
<i>
const bookDetails = {
	"title": "Harry Potter",
	"author": "J.K. Rowling",
	alreadyRead: false,
	"isAvailable": true
}
</i>
</testcase>
<testcase>
<i>
const bookDetails = {
	"title": "Sherlock Holmes",
	"author": "Arthur Conan Doyle",
	alreadyRead: false,
	"isAvailable": false
}
</i>
</testcase>
</testcases>
</codeblock>
