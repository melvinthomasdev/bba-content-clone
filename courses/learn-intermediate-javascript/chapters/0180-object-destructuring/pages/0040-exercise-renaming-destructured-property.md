Modify the code below,
to copy the value of the property `id`
from the object `user`
and
store it in a variable `userID`
using destructuring.

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