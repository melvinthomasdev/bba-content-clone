Modify the code below,
to copy the value of the property `id`
from the object `user`
and
store it in a variable `userID`
using destructuring.

For example:

```js
Input: user = {
  id: "eve.smith",
  name: "Eve Smith",
  age: 28,
};

Output: "eve.smith"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const user = {
  id: "sam.smith",
  name: "Sam Smith",
  age: 32,
}

console.log(userID);

</code>

<solution>
const user = {
  id: "sam.smith",
  name: "Sam Smith",
  age: 32,
}

const { id: userID } = user;
console.log(userID);

</solution>
</codeblock>
