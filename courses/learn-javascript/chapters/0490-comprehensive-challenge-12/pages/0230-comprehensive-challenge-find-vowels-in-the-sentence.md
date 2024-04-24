The function `findVowels` should return the vowels found in the given sentence.

1. Make sure to return only one instance of any vowel found in the `sentence` string given as input.
2. Returned vowels should be alphabetically sorted and in lower case.
3. If no vowels are present return an empty array.

For example:
```js
Input:
sentence = `The quick brown fox jumps over the lazy dog.`

Output: ['a', 'e', 'i', 'o', 'u']
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findVowels = sentence => {
  // your code here
}
</code>

<solution>
const findVowels = sentence => {
  const vowelFreq = {a:0,e:0,i:0,o:0,u:0};
  [...sentence].forEach(letter => {
      vowelFreq[letter] += 1;
  });
  return Object.keys(vowelFreq).filter(vowel => vowelFreq[vowel] > 0);
}
</solution>

<testcases>
<caller>
console.log(findVowels(sentence));
</caller>
<testcase>
<i>
const sentence = 'Sly lynx fly by my crwth.'
</i>
</testcase>
<testcase>
<i>
const sentence = 'Good Morning, have some tea!'
</i>
</testcase>
<testcase>
<i>
const sentence = `We can use regular expressions, which are basically patterns to match character combinations in strings`
</i>
</testcase>
<testcase>
<i>
const sentence = `The quick brown fox jumps over the lazy dog.`
</i>
</testcase>
</testcases>
</codeblock>
