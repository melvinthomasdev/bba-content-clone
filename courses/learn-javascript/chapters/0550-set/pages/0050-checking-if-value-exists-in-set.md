The `has()` method can be used to check
if a given element is present in a **set**.

The `has()` method takes
the element to be searched for
as the argument.
It returns `true` if the element
is found in the set.
Otherwise, it returns `false`.

<codeblock language="javascript" type="lesson">
<code>
const names = new Set(["Sam", "Oliver", "Adam"]);

const namesIncludesSam = names.has("Sam");
const namesIncludesEve = names.has("Eve");

console.log(namesIncludesSam);
console.log(namesIncludesEve);
</code>
</codeblock>