Store all of the elements
from the `users` array
in `updatedUsers`,
excluding the object that
has the value **"Sam"**
for the `name` property.

Note that the array `users`
should not be mutated.

```js
Input: users = [
  { name: "Eve", age: 28 },
  { name: "Sam", age: 32 },
  { name: "Linh", age: 25 },
  { name: "Carlos", age: 30 },
]
Output:
[
  { name: "Eve", age: 28 },
  { name: "Sam", age: 32 },
  { name: "Linh", age: 25 },
  { name: "Carlos", age: 30 },
]
[
  { name: "Eve", age: 28 },
  { name: "Linh", age: 25 },
  { name: "Carlos", age: 30 },
]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const users = [
  { name: "Sam", age: 32 },
  { name: "Oliver", age: 21 },
  { name: "Adam", age: 46 },
  { name: "Eve", age: 24 },
];

const updatedUsers = ;

console.log(users);
console.log(updatedUsers);

</code>

<solution>
const users = [
  { name: "Sam", age: 32 },
  { name: "Oliver", age: 21 },
  { name: "Adam", age: 46 },
  { name: "Eve", age: 24 },
];

const updatedUsers = users.filter(user => user.name !== "Sam");

console.log(users);
console.log(updatedUsers);

</solution>
</codeblock>
