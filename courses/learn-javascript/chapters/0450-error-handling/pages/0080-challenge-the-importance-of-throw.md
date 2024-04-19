In the code given below,
the `user` object contains data
that is parsed from a JSON string.
Check if the `user` object contains
a property with the key `email`.
If it doesn't,
throw an error **"Email is not present"**
using `new Error()`.

```js
Output:
`Uncaught Error: Email is not present`
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const inputData = '{ "name": "Sam Smith", "age": 32 }';
const user = JSON.parse(inputData);
</code>

<solution>
const inputData = '{ "name": "Sam Smith", "age": 32 }';
const user = JSON.parse(inputData);

if (!user.email) throw new Error("Email is not present");
</solution>
</codeblock>
