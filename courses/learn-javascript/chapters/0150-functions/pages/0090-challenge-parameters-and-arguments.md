Define a function
`displayGreeting`
with two parameters
`firstName`
and
`lastName`.
If the value of `firstName`
is **"Oliver"**
and the value of `lastName`
is **"Smith"**,
the function should display
**"Hello, Oliver Smith!"**
using a template string.

For example:
```js
Input: firstName = "Sam", lastName = "Smith"

Output: "Hello, Sam Smith!"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const displayGreeting = () => {
  console.log();
}

displayGreeting("Eve", "Smith");
</code>

<solution>
const displayGreeting = (firstName, lastName) => {
  console.log(`Hello, ${firstName} ${lastName}!`);
}

displayGreeting("Eve", "Smith");
</solution>
</codeblock>
