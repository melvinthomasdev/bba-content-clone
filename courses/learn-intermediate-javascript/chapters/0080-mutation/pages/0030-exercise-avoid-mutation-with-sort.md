Sort the elements of `names` alphabetically,
and
store them in `sortedNames`.

Note that the `names` array
should not be mutated.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const names = ["Sam", "Oliver", "Adam", "Eve"];

const sortedNames = ;

console.log(names);
console.log(sortedNames);
</code>

<solution>
const names = ["Sam", "Oliver", "Adam", "Eve"];

const sortedNames = [...names].sort();

console.log(names);
console.log(sortedNames);
</solution>
</codeblock>