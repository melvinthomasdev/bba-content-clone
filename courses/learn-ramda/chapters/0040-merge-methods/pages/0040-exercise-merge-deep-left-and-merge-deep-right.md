Set `author.lastName` to `R R Martin` in the given object `book`. Make sure that `firstName` doesn't get deleted.

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

const newBook = R. //Use the appropriate Ramda function here.

console.log(newBook);
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

const newBook = R.mergeDeepLeft({
  author: {
    lastName: "R R Martin"
  }
}, book);

console.log(newBook);
</solution>
</codeblock>
