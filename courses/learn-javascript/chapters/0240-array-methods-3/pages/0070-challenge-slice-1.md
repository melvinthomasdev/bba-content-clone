Use the `slice()` method to
copy the first two elements
from the `names` array
into `namesSubArray`.

For example:
```js
Input: ["Sam", "Eve", "Linh", "Carlos"]

Output: ["Sam", "Eve"]
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const names = ["Adam", "Eve", "Oliver", "Sam"];
const namesSubArray = ;
console.log(namesSubArray);
</code>

<solution>
const names = ["Adam", "Eve", "Oliver", "Sam"];
const namesSubArray = names.slice(0, 2);
console.log(namesSubArray);
</solution>
</codeblock>
