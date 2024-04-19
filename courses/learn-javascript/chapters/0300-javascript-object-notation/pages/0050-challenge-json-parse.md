Use `JSON.parse()` to convert
the JSON string `adminDetailsJSON`
into an object.

For example:
```js
Input: {"name": "Sam", "age": 40, "isAdmin": false}

Output: {name: "Sam", age: 40, isAdmin: false}
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const adminDetailsJSON = '{"name":"Adam","age":32,"isAdmin":true}';

const adminDetails = ;
console.log(adminDetails);
</code>

<solution>
const adminDetailsJSON = '{"name":"Adam","age":32,"isAdmin":true}';

const adminDetails = JSON.parse(adminDetailsJSON);
console.log(adminDetails);
</solution>
</codeblock>
