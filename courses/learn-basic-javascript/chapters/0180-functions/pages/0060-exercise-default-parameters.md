- Update the function `displayPackageInfo`
  to have two two arguments
  `orderID` and `status`.

- Based on the arguments received,
  the function should display
  `Your package #<orderID> is <status>`
  using a template string.

- The default value of `status`
  should be **"to be dispatched"**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const displayPackageInfo = () => {
  // write your code here
};

displayPackageInfo("ABC123");
</code>

<solution>
const displayPackageInfo = (orderID, status = "to be dispatched") => {
  console.log(`Your package #${orderID} is ${status}`);
};

displayPackageInfo("ABC123");
</solution>
</codeblock>
