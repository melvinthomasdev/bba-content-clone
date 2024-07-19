Write a regular expression pattern
to match any string that contains
a sequence of one or more words.

Test your regular expression against the
provided strings and verify if it matches
the expected results.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const strings = [
  "hello world",
  "apple123",
  "example456",
  "123test",
  "word"
];

// Write code below this line
</code>
<solution>
const strings = [
  "hello world",
  "apple123",
  "example456",
  "123test",
  "word"
];

// Write code below this line
const regex = /\w/;

strings.forEach((string, index) => {
  console.log(`String ${index + 1}: ${regex.test(string)}`);
});
</solution>
</codeblock>
