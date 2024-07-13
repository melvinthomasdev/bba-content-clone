Write a regular expression pattern
to match any string that contains one
or more occurrences of the word `hello`.

Test your regular expression against the
provided strings and verify if it matches
the expected results and print the output
in below given format.

```js
Expected Output:
String 1: true
String 2: true
String 3: true
String 4: false
String 5: true
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const strings = [
  "hello world",
  "hellohello",
  "hi hello hello",
  "no matches here",
  "hello"
];

// Write code below this line
</code>
<solution>
const strings = [
  "hello world",
  "hellohello",
  "hi hello hello",
  "no matches here",
  "hello"
];

// Write code below this line
const regex = /hello+/;

strings.forEach((string, index) => {
  console.log(`String ${index + 1}: ${regex.test(string)}`);
});
</solution>
</codeblock>
