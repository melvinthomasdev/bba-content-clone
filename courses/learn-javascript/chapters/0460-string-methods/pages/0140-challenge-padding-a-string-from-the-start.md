- Use the `padStart` method to
  add padding to the string
  stored in `cardNumberEnding`
  and store it in `maskedCardNumber`.

- The length of `maskedCardNumber`
  should be **16**.

- Use `"*"` for padding.

For example:
```js
Input: cardNumberEnding = "3206"

Output: "************3206"
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const cardNumberEnding = "1234";
const maskedCardNumber = ;
console.log(maskedCardNumber);
</code>

<solution>
const cardNumberEnding = "1234";
const maskedCardNumber = cardNumberEnding.padStart(16, "*");
console.log(maskedCardNumber);
</solution>
</codeblock>
