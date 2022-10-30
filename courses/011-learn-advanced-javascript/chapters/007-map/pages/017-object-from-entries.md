We can use `Object.fromEntries()` method
to convert a Map to an object.

<Editor lang="javascript">
<code>
let myMap = new Map([
  ["name", "Sam Smith"],
  ["age", 32],
  ["isAdmin", false]
])
let person = Object.fromEntries(myMap);
console.log(person);
</code>
</Editor>