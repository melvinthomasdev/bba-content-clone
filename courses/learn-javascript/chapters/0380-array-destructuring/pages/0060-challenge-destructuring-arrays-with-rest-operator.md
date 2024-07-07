The `names` array in code given below,
are the names of the runners
who finished a race,
in the order in which they finished.

Store the names of the runners
who finished first and second
in the variables `winner` and `runnerUp`,
respectively.
Display their names,
using template strings,
as shown below:

"Sam finished first"

"Oliver finished second"

Store the rest of the names
as an array `otherRunners`
and
display that array.

For example:

```js
Input: ["Sam", "Eve", "Linh", "Chinua"]

Output:
"Sam finished first"
"Eve finished second"
["Linh", "Chinua"]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const names = ["Sam", "Oliver", "Adam", "Eve"];
</code>

<solution>
const names = ["Sam", "Oliver", "Adam", "Eve"];

const [winner, runnerUp, ...otherRunners] = names;

console.log(`${winner} finished first`);
console.log(`${runnerUp} finished second`);
console.log(otherRunners);

</solution>
</codeblock>
