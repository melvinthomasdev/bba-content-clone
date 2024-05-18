Sort the `originalArray` in
descending order without mutating
it
and
store it in a variable
named `sortedDescending`.

Log the value of `sortedDescending`
to the console.

For example:

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const originalArray = [4, 2, 7, 1, 9];

// Write code below this line
</code>

<solution>
const originalArray = [4, 2, 7, 1, 9];

// Write code below this line
const sortedDescending = [...originalArray].sort((a, b) => b - a);
console.log(sortedDescending);
</solution>
</codeblock>
