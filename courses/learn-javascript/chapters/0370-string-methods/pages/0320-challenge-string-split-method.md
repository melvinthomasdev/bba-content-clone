Write a function called `splitWords`, which accepts
the given `sentence` as an argument and splits the `sentence`
into individual words and console logs the array of words.

```js
Output:
["JavaScript", "is", "supported", "by", "all", "modern", "web", "browsers"]
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const sentence = "JavaScript-is-supported-by-all-modern-web-browsers";

function splitWords(sentence) {
  // Write your code here
}
</code>

<solution>
const sentence = "JavaScript-is-supported-by-all-modern-web-browsers";

function splitWords(sentence) {
  const words = sentence.split("-");
  console.log(words);
}

splitWords(sentence);
</solution>
</codeblock>
