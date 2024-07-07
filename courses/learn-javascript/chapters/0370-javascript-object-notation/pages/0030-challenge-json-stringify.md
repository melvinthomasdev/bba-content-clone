Use `JSON.stringify()`
to convert the object `adminDetails`
into a JSON string.

For example:
```js
Input: {name: "Sam", age: 40, isAdmin: false}

Output: {"name": "Sam", "age": 40, "isAdmin": false}
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const adminDetails = {
  name: "Adam",
  age: 32,
  isAdmin: true,
};

const adminDetailsJSON = ;

console.log(adminDetailsJSON);
</code>

<solution>
const adminDetails = {
  name: "Adam",
  age: 32,
  isAdmin: true,
};

const adminDetailsJSON = JSON.stringify(adminDetails);

console.log(adminDetailsJSON);
</solution>
</codeblock>
