Use array destructuring to
copy the array elements `Sam`
and
`Smith` into the variables
`firstName` and `lastName`.

<Editor type="exercise" lang="javascript">
<code>
let name = ["Sam", "Smith"];

console.log(firstName);
console.log(lastName);
</code>

<solution>
let name = ["Sam", "Smith"];
let [firstName, lastName] = name
console.log(firstName);
console.log(lastName);
</solution>
</Editor>