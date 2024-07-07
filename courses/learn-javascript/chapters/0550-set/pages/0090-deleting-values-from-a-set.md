The `delete()` method
removes an element from a Set.

The `delete()` method
takes the value of the element
to be deleted as argument.
If it finds the element inside the set
and
deletes the element,
it returns `true`.
It returns `false` if it was
unable to find the element in the set.

<codeblock language="javascript" type="lesson">
<code>
const names = new Set(["Sam", "Oliver", "Adam"]);

if (names.delete("Adam")) {
  console.log(names);
} else {
  console.log("Could not find Adam in names");
}
</code>
</codeblock>