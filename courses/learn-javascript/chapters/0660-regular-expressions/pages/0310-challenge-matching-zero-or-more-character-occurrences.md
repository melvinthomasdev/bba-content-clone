Write a regular expression pattern
to match any word that starts with
`regex`
and
also the word `regex` itself.

Test your regular expression against
the provided strings.

```js
Expected Output:
String 1: regex
String 2: regex123
String 3: regexsuffix
String 4: null
String 5: regexPattern
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const strings = [
  "regex",
  "regex123",
  "prefixregexsuffix",
  "no match here",
  "regexPattern"
];
// Write your code below this line
</code>
<solution>
const strings = [
  "regex",
  "regex123",
  "prefixregexsuffix",
  "no match here",
  "regexPattern"
];

// Write your code below this line
const regex = /regex\w*/;

strings.forEach((string, index) => {
  console.log(`String ${index + 1}: ${string.match(regex)}`);
});
</solution>
</codeblock>
