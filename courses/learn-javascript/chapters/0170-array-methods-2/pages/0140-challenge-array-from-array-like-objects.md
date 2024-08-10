Use `Array.from()` to
create an array.
This array should be of length 5.
It should consist of all the vowels,
`a, e, i, o, u`.

Display the array on the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code below this line

</code>
<solution>
// Write your code below this line
const vowels = {
    0: 'a',
    1: 'e',
    2: 'i',
    3: 'o',
    4: 'u',
    length: 5
}

const vowelsList = Array.from(vowels);
console.log(vowelsList);
</solution>
</codeblock>
