- Define a function
  `displayPackageInfo`
  with two parameters
  `orderID`
  and
  `status`.

- If the value of `orderID`
  is **"ABC123"**
  and the value of `status`
  is **"on the way"**,
  the function should display
  **"Your package #ABC123 is on the way"**
  using a template string.

- The default value of `status`
  should be **"to be dispatched"**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const displayPackageInfo = () => {
  console.log();
}

displayPackageInfo("ABC123", "on the way");
</code>

<solution>
const displayPackageInfo = (orderID, status = "to be dispatched") => {
  console.log(`Your package #${orderID} is ${status}`);
}

displayPackageInfo("ABC123");
</solution>
</codeblock>