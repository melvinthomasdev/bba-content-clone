Use the `slice()` method to
copy the last two elements
from the `names` array
into `namesSubArray`.

For example:
```js
Input: names = ["Eve", "Sam", "Carlos", "Chinua"]

Output: ["Carlos", "Chinua"]
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const names = ["Adam", "Eve", "Oliver", "Sam"];
const namesSubArray = ;
console.log(namesSubArray);
</code>

<solution>
const names = ["Adam", "Eve", "Oliver", "Sam"];
const namesSubArray = names.slice(-2);
console.log(namesSubArray);
</solution>
</codeblock>
