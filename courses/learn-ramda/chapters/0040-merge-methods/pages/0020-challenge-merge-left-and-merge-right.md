Create a curried function that will add a key called `downloadedToday` with the value `false` to the `book` object.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const book = {
	id: 1,
	title: "A Game of Thrones",
	author: {
		firstName: "George",
		lastName: "Martin",
	}
};

const addDownloadedToday = ;//Complete this curried function.

console.log(addDownloadedToday(book));
</code>
<solution>
const book = {
	id: 1,
	title: "A Game of Thrones",
	author: {
		firstName: "George",
		lastName: "Martin",
	}
};

const addDownloadedToday = R.mergeLeft({ downloadedToday: false });

console.log(addDownloadedToday(book));
</solution>
</codeblock>

Create a curried function that will set the `author` key with the value `George R R Martin` if `author` key doesn't exist.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const firstBook = {
	id: 1,
	title: "A Game of Thrones",
	author: {
		firstName: "George",
		lastName: "Martin",
	}
};

const secondBook = {
	id: 2,
	title: "A Clash of Kings",
};

const addAuthor = ;//Complete this curried function.

console.log(addAuthor(firstBook));
/* returns the following
{
	id: 1,
	title: "A Game of Thrones",
	author: {
		firstName: "George",
		lastName: "Martin",
	}
}
*/

console.log(addAuthor(secondBook));

/* returns the following
{
	id: 1,
	title: "A Game of Thrones",
	author: "George R R Martin",
}
*/
</code>
<solution>
const firstBook = {
	id: 1,
	title: "A Game of Thrones",
	author: {
		firstName: "George",
		lastName: "Martin",
	}
};

const secondBook = {
	id: 2,
	title: "A Clash of Kings",
};

const addAuthor = R.mergeRight({ author: "George R R Martin" });

console.log(addAuthor(firstBook));
console.log(addAuthor(secondBook));
</solution>
</codeblock>
