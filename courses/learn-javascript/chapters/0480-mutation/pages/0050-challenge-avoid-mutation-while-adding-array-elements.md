Add `{ name: "Eve", age: 24 }`
to the list of `users`
and
store the new list in `updatedUsers`.

Note that the `users` array
should not be mutated.

For example:
```js
Input: users = [
  { name: "Sam", age: 25 },
  { name: "Linh", age: 28 },
  { name: "Chinua", age: 30 },
]

Output:
[
  { name: "Sam", age: 25 },
  { name: "Linh", age: 28 },
  { name: "Chinua", age: 30 },
]
[
  { name: "Sam", age: 25 },
  { name: "Linh", age: 28 },
  { name: "Chinua", age: 30 },
  { name: "Eve", age: 24 }
]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const users = [
  { name: "Sam", age: 32 },
  { name: "Oliver", age: 21 },
  { name: "Adam", age: 46 },
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
];

const updatedUsers = [...users, { name: "Eve", age: 24 }];

console.log(users);
console.log(updatedUsers);
</solution>
</codeblock>
