You are developing a text processing utility for a new language learning app. The app needs a function to convert a given string into an array of letters, where each letter is prefixed with `Letter - `. You have been tasked with implementing this by updating the function **generateText**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string = "HelloWorld";

const generateText = (string) => {
  // Write your code here
};

console.log(generateText(string));
</code>
<solution>
const string = "HelloWorld";

const generateText = (string) => {
  return Array.from(string, (letter) => `Letter - ${letter}`);
};

console.log(generateText(string));
</solution>
</codeblock>
