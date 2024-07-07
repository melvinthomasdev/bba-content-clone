Use a `for...in` loop to show
all the **values** stored
in each property
of the `person` object.

Use `console.log` to print the output.

```js
Output:
"Adam Smith"
37
true
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};
</code>

<solution>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

for (const key in person) {
  console.log(person[key]);
}
</solution>
</codeblock>
