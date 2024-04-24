Write a program which will
print the provided name in it's
abbreviated form.

For example:
```js
Input: name = "Paul Thomas Anderson"

Output: "P.T.Anderson"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const name = "Paul Thomas Anderson"
// Write code below this line
</code>

<solution>
const name = "Paul Thomas Anderson";
// Write code below this line

// split name and assign
const [firstName, middleName, lastName] = name.split(" ");

const firstLetterOfFirstName = firstName[0];
const firstLetterOfMiddletName = middleName[0];

// Print
console.log(`${firstLetterOfFirstName}.${firstLetterOfMiddletName}.${lastName}`);
</solution>
</codeblock>
