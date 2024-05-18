Create a function `displayPackageInfo`
to have two two arguments:
`orderID`
and
`status`

Based on the arguments received,
the function should display
`Your package #<orderID> is <status>`
using a template string.

The default value of `orderID`
should be **0001**
and
`status` should be
**"to be dispatched"**.

Call the function without
any parameters.

```js
Output:
"Your package #0001 is to be dispatched"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
// Write code below
</code>

<solution>
// Write code below

const displayPackageInfo = (orderID = "0001", status = "to be dispatched") => {
  console.log(`Your package #${orderID} is ${status}`);
};

displayPackageInfo();
</solution>
</codeblock>
