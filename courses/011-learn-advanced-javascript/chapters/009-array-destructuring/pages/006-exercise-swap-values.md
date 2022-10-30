Use destructuring to
interchange the values
of the variables
**firstName** and **lastName**.

<Editor type="exercise" lang="javascript">
<code>
let firstName = "Oliver";
let lastName = "Smith";

console.log(`First Name: ${firstName}. Last Name: ${lastName}.`);
</code>

<solution>
let firstName = "Oliver";
let lastName = "Smith";

[firstName, lastName] = [lastName, firstName];
console.log(`First Name: ${firstName}. Last Name: ${lastName}.`);
</solution>
</Editor>