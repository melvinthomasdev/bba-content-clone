Write a regular expression pattern
to find all occurrences of the word
"test" in the provided text.

Test your regular expression against
the provided strings.

```js
Expected Output:
String 1: test
String 2: test,test
String 3: null
String 4: test
String 5: null
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const strings = [
  "This is a Good test.",
  "Another good test, and another test.",
  "No matches here.",
  "One last test!",
  "Completely unrelated string."
];

// Write code below this line
</code>
<solution>
const strings = [
  "This is a test.",
  "Another test, and another test.",
  "No matches here.",
  "One last test!",
  "Completely unrelated string."
];

// Write your code below this line
const regexWithGFlag = /test/g;

strings.forEach((string, index) => {
  const matches = string.match(regexWithGFlag);
  console.log(`String ${index + 1}: ${matches}`);
});
</solution>
</codeblock>
