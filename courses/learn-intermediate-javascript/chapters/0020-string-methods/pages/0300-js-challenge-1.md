Given a credit card number. Update the function `maskCardNumber` to return these numbers with only the last 4 digits displayed and the rest replaced with `*`. The length of the card number can vary.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const maskCardNumber = (cardNumber) => {
  // Write your code here
};
const cardNumber = '5555 5555 5555 4444';
console.log(maskCardNumber(cardNumber));
</code>
<solution>
const maskCardNumber = (cardNumber) => {
  const cardNumberLength = cardNumber.trim().length;
  const lastFourDigits = cardNumber.slice(-4);
  const numberArray = lastFourDigits.padStart(cardNumberLength, "*");
  return numberArray;
};
const cardNumber = '5555 5555 5555 4444';
console.log(maskCardNumber(cardNumber));
</solution>
</codeblock>

It should be written `JavaScript` and not `javascript`.
Update the function `fixJavaScript` to return the fixed version of the below excerpt from an interview with Brendan Eich, the founder of JavaScript before he sees it.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const interviewExcerpt = `InfoWorld: As I understand it, javascript started out as Mocha, then became LiveScript and then became javascript when Netscape and Sun got together. But it actually has nothing to do with Java or not much to do with it, correct?
Eich: That's right. It was all within six months from May till December (1995) that it was Mocha and then LiveScript. And then in early December, Netscape and Sun did a license agreement and it became javascript. And the idea was to make it a complementary scripting language to go with Java, with the compiled language.`;

const fixJavaScript = (interviewExcerpt) => {
  // Write your code here
};
console.log(fixJavaScript(interviewExcerpt));
</code>
<solution>
const interviewExcerpt = `InfoWorld: As I understand it, javascript started out as Mocha, then became LiveScript and then became javascript when Netscape and Sun got together. But it actually has nothing to do with Java or not much to do with it, correct?
Eich: That's right. It was all within six months from May till December (1995) that it was Mocha and then LiveScript. And then in early December, Netscape and Sun did a license agreement and it became javascript. And the idea was to make it a complementary scripting language to go with Java, with the compiled language.`;

const fixJavaScript = (interviewExcerpt) => {
  return interviewExcerpt.replaceAll("javascript", "JavaScript");
};

console.log(fixJavaScript(interviewExcerpt));
</solution>
</codeblock>

Update function `trimUnits` such that it clears out the unit mentioned (`px`, `em`, `cm` etc) and returns the numerical value.
For example: `4px` should return 4. The length of all units will be given as `unitLength`.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const unitValue = "12rem";
const unitLength = 3;
const trimUnits = (unitValue, unitLength) => {
  // Write your code here
};
console.log(trimUnits(unitValue, unitLength));
</code>
<solution>
const trimUnits = (unitValue, unitLength) => {
  return unitValue.slice(0, -unitLength);
};
const unitValue = "12rem";
const unitLength = 3;
console.log(trimUnits(unitValue, unitLength));
</solution>
</codeblock>
