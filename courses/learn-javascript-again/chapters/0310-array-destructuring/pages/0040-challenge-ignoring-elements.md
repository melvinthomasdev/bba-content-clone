Use array destructuring to
copy the array elements `"Sam"`
and
`"Smith"` into the variables
`firstName` and `lastName`
respectively.

Use a comma to ignore the **second** element.

For example:
```js
Input: name = ["Eve", "Sam", "Tran"]

Output:
"Eve Tran"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const name = ["Sam", "William", "Smith"];

console.log(`${firstName} ${lastName}`);
</code>

<solution>
const name = ["Sam", "William", "Smith"];
const [firstName, , lastName] = name
console.log(`${firstName} ${lastName}`);
</solution>
</codeblock>
