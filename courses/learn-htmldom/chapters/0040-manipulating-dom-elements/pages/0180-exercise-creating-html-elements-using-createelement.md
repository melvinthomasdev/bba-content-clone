<!-- BUG: Incorrect solution -->
Create a new `section` element and store
it in the variable `newSection`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
let newSection = ;
console.log(newSection);
</code>

<solution>
let newSection = document.createElement('section');
console.log(newSection);
</solution>
</codeblock>