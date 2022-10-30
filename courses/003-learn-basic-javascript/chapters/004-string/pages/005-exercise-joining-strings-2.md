The variable `firstName` stores the string `Sam`
and
the variable `lastName` stores `Smith`.

If we run the code in the editor,
we see that there is no space
between the two strings.

Insert a space between
the two strings.

<Editor lang="javascript" type="exercise">
<code>
const firstName = "Sam";
const lastName = "Smith";
const fullName = firstName + lastName;
console.log(fullName);
</code>

<solution>
const firstName = "Sam";
const lastName = "Smith";
const fullName = firstName + " " + lastName;
console.log(fullName);
</solution>
</Editor>