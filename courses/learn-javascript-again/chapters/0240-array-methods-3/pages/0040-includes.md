The `includes()` method searches
for an element in the array.
If the element is present
in the array,
it returns `true`.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango"];
console.log(fruits.includes("banana"));
</code>
</codeblock>

If the element is not present
in the array,
`includes()` returns `false`.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango"];
console.log(fruits.includes("orange"));
</code>
</codeblock>

In the above example, we haven't used `indexOf()` method
instead of `includes()`, because of the purpose for which
each of these methods were created in the first place.
`indexOf()` is used when
we not only have to check
if an element is found in an array,
but also know the index of the element
in that array.
`includes()` is used when we only need
to check for the presence of an element.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango"];

if (fruits.includes("banana")) {
  console.log('"banana" exists inside the array');
}

if (fruits.indexOf("banana") > 0) {
  console.log('"banana" is not the first element in the array');
}
</code>
</codeblock>