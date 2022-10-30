If the number of elements
in the array is lesser
than the number of variables provided
in the destructuring assignment,
then the missing values
are considered `undefined`.

<Editor lang="javascript">
<code>
let [firstName, lastName] = ["Sam"];

console.log(firstName);
console.log(lastName);
</code>
</Editor>

We can store default values
for the variables. The default
values are used only when
the array element is missing.

<Editor lang="javascript">
<code>
let [firstName = "First name is empty", lastName = "Last name is empty"] = ["Sam"];

console.log(firstName);
console.log(lastName);
</code>
</Editor>