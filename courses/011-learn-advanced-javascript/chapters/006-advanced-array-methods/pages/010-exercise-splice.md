Use the `splice()` method
to remove the element `Oliver`
and
add the element `Eve` in its place.

<Editor lang="javascript" type="exercise">
<code>
let names = ["Adam", "Oliver", "Sam"];
let newNamesArray = ;
console.log(names);
</code>

<solution>
let names = ["Adam", "Oliver", "Sam"];
let newNamesArray = names.splice(1, 1, "Eve");;
console.log(names);
</solution>
</Editor>