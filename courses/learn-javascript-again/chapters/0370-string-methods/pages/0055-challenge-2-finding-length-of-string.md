In the variable **secretCode**,
you've got a top-secret code.
A secret word is hidden within the
secret code at various positions.

- Use the **length** property to
  find out how many characters
  the **secretCode** has and store the result
  in **codeLength**.

- Discover the hidden secret word
  by finding the characters at
  the second, fifth, tenth, third-last,
  and last positions.

- Use the **length** property
  to find the **thirdLastCharacter**
  and **lastCharacter**.

```js
Output:
"The secret code has 20 characters!"
"The secret word is BINGO!"
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const secretCode = "YB7RIQ6K8N5YBQK8FGYO";
const secondCharacter = ;
const fifthCharacter = ;
const tenthCharacter = ;
const thirdLastCharacter = ;
const lastCharacter = ;
const codeLength = ;

console.log(`The secret code has ${codeLength} characters!`);

console.log(`The secret word is ${secondCharacter}${fifthCharacter}${tenthCharacter}${thirdLastCharacter}${lastCharacter}!`);
</code>

<solution>
const secretCode = "YB7RIQ6K8N5YBQK8FGYO";
const secondCharacter = secretCode[1];
const fifthCharacter = secretCode[4];
const tenthCharacter = secretCode[9];
const thirdLastCharacter = secretCode[secretCode.length - 3];
const lastCharacter = secretCode[secretCode.length - 1];
const codeLength = secretCode.length;

console.log(`The secret code has ${codeLength} characters!`);

console.log(`The secret word is ${secondCharacter}${fifthCharacter}${tenthCharacter}${thirdLastCharacter}${lastCharacter}!`);
</solution>
</codeblock>
