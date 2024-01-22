Use the spread operator to split
the value of `reptile` into
an array of its letters.

Store the array of letters
in the `lettersArray` variable.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const reptile = "Crocodile";
const lettersArray = ;

console.log(lettersArray);
</code>

<solution>
const reptile = "Crocodile";
const lettersArray = [...reptile];

console.log(lettersArray);
</solution>
</codeblock>