Write a regular expression pattern to find all
occurrences of numbers in the provided text.

Test your regular expression against
the provided strings.

```js
Expected Output:
String 1: 123
String 2: 456, 789
String 3: 101112
String 4: null
String 5: 3, 14159, 314159
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const strings = [
  "The number is 123.",
  "Numbers like 456 and 789 are important.",
  "Concatenated numbers 101112 are tricky.",
  "No numbers here!",
  "Pi is roughly 3.14159, often shortened to 314159."
];
// Write your code below this line
</code>
<solution>
const strings = [
  "The number is 123.",
  "Numbers like 456 and 789 are important.",
  "Concatenated numbers 101112 are tricky.",
  "No numbers here!",
  "Pi is roughly 3.14159, often shortened to 314159."
];

// Write your code below this line
const regexWithGFlag = /\d+/g;

strings.forEach((string, index) => {
  const matches = string.match(regexWithGFlag);
  console.log(`String ${index + 1}: ${matches}`);
});
</solution>
</codeblock>
