Access `authCode` returned by the dummy decode function, inside the authentication function `Auth` inside the `mainApp`, and return the same.

Return the `authCode` from the `mainApp` function through the `auth` function.

1. Try to achieve it with a one-line change.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const mainApp = ({ code, decoder }) => {
  const authCode = decoder(code);
  const auth = () => // your code here
}
</code>

<solution>
const mainApp = ({ code, decoder }) => {
  const authCode = decoder(code);
  const auth = () => authCode;
  return auth();
}
</solution>

<testcases>
<caller>
console.log(mainApp({ code, decoder }));
</caller>
<testcase>
<i>
const code = '4X2&rs%#7D';
const decoder = (value) => {
  return 'decodedValue';
}
</i>
</testcase>
<testcase>
<i>
const code = '3f39d1078!*';
const decoder = () => {
  return 'decodedValue';
}
</i>
</testcase>
<testcase>
<i>
const code = '37EG01!#$19*';
const decoder = (value) => {
  return 'decodedValue';
}
</i>
</testcase>
<testcase>
<i>
const code = '84Ig!012*';
const decoder = () => {
  return 'decodedValue';
}
</i>
</testcase>
</testcases>
</codeblock>