
Use the `filter()` method
to get all the elements
in the `names` array whose length
is less than `5`
and
store them in the `shortNames` array.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const names = ["Adam", "Eve", "Oliver", "Sam"];
const shortNames = ;
console.log(shortNames);
</code>

<solution>
const names = ["Adam", "Eve", "Oliver", "Sam"];
const shortNames = names.filter(name => name.length < 5);
console.log(shortNames);
</solution>
</codeblock>