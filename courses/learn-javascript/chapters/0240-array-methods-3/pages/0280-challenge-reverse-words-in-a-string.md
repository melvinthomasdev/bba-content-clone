Create a function `reverseWords`
that takes a string as input
and
returns a new sentence with
the order of the words reversed.

For example:
```js
Input:
string = "A Good Day"

Output:
"Day Good A"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "Hello world this is JavaScript";
const string2 = "Reverse this sentence";

// Write code below this line

console.log(reverseWords(string1));
console.log(reverseWords(string2));
</code>
<solution>
const string1 = "Hello world this is JavaScript";
const string2 = "Reverse this sentence";

// Write code below this line
const reverseWords = (sentence) => {
  const wordsArray = sentence.split(' ');
  const reversedWordsArray = wordsArray.reverse();

  const reversedSentence = reversedWordsArray.join(' ');

  return reversedSentence;
};

console.log(reverseWords(string1));
console.log(reverseWords(string2));
</solution>
</codeblock>
