The `fill()` method changes
values inside an array with
a value of our choice.

Take a look:
<codeblock language="javascript" type="lesson">
<code>
const names = ["Eve Smith", "Sam Smith", "Renu Sen", "Lao Xun", "John Doe", "Linh Tran",
"Jane Doe", "Chinua Achebe", "Carlos Alberti"]
names.fill("Unknown");
console.log(names);
</code>
</codeblock>

The `fill()` method changes the
existing array and returns it.