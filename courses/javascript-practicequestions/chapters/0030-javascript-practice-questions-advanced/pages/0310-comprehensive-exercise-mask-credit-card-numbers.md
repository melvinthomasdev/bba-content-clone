Given some credit card numbers as input, return it with only the last 4 digits displayed and the rest masked with `*`.

1. The length of the returned value should be the same as the `cardNumber` digits.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const maskCreditCardNumber = cardNumber => {
  // your code here
}
</code>

<solution>
const maskCreditCardNumber = cardNumber => {
  const trimmedNumber = cardNumber.replaceAll(' ','');
  const lastFourDigits = trimmedNumber.slice(-4);
  return lastFourDigits.padStart(trimmedNumber.length, '*');
}
</solution>

<testcases>
<caller>
console.log(maskCreditCardNumber(cardNumber));
</caller>
<testcase>
<i>
const cardNumber = '5555 5555 5555 4444';
</i>
</testcase>
<testcase>
<i>
const cardNumber = '5105 1051 0510 5100';
</i>
</testcase>
<testcase>
<i>
const cardNumber = '4111 1111 1111 1111';
</i>
</testcase>
<testcase>
<i>
const cardNumber = '4012 8888 8888 1881';
</i>
</testcase>
</testcases>
</codeblock>