The `join()` method creates
a string by joining
all the array elements.

<Editor lang="javascript">
<code>
let fruitsArray = ["apple", "banana", "mango", "orange"];
let fruitsString = fruitsArray.join(",");
console.log(fruitsString);
</code>
</Editor>

It uses a separator string
like a comma between all
the different array elements.

`join` converts `undefined`,
`null` or `[]` (empty array)
into empty strings.

<Editor lang="javascript">
<code>
let fruitsArray = ["apple", null, "banana", "mango",  [], "orange"];
let fruitsString = fruitsArray.join(", ");
console.log(fruitsString);
</code>
</Editor>