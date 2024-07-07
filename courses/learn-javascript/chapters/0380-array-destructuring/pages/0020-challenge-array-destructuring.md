Use array destructuring to
copy the array elements `"Sam"`
and
`"Smith"` into the variables
`firstName` and `lastName`
respectively.

For example:

```js
Input: name = ["Chinua", "Achebe"];

Output:
"Chinua"
"Achebe"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const name = ["Sam", "Smith"];

console.log(firstName);
console.log(lastName);

</code>

<solution>
const name = ["Sam", "Smith"];
const [firstName, lastName] = name
console.log(firstName);
console.log(lastName);
</solution>
</codeblock>
