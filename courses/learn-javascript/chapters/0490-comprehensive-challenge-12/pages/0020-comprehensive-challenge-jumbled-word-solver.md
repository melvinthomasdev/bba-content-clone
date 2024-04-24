The function `solveJumbledWords` should return the solution to the jumbled words passed to it.

1. The 'sampleDictionary' might or might not contain the correct word.
2. If the solution is not present in 'sampleDictionary', then return false

For example:
```js
Input:
word = 'AEBUMRCNSSL'
sampleDictionary = ['Personality', 'Quadrillion', 'Abandonedly', 'Unscrambles', 'Abashedness']

Output:
'Unscrambles'
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const solveJumbledWords = ({ word, sampleDictionary }) => {
  // your code here
}
</code>

<solution>
const solveJumbledWords = ({ word, sampleDictionary }) => {
  const sortedWord = sortWord(word);
  return sampleDictionary.reduce(
    (resultantWord, dictionaryWord, currentIdx) =>
      sortWord(dictionaryWord) === sortedWord
        ? sampleDictionary[currentIdx]
        : resultantWord,
    false
  );
};

const sortWord = word => word.toLowerCase().split("").sort().join("");
</solution>

<testcases>
<caller>
console.log(solveJumbledWords({ word, sampleDictionary }));
</caller>
<testcase>
<i>
const word = 'AEBUMRCNSSL';
const sampleDictionary = ['Personality', 'Quadrillion', 'Abandonedly', 'Unscrambles', 'Abashedness'];
</i>
</testcase>
<testcase>
<i>
const word = 'AEHPSSR';
const sampleDictionary = ['Surbase', 'Uncases', 'Phrases', 'Rubasse', 'Sucrase'];
</i>
</testcase>
<testcase>
<i>
const word = 'ABELLLSY';
const sampleDictionary = ['Syllabus', 'Intellectualism', 'Pacifism', 'Syllable', 'Sidewall'];
</i>
</testcase>
<testcase>
<i>
const word = 'VSRLEO';
const sampleDictionary = ['Pollen', 'Pulley', 'Follow', 'Solve'];
</i>
</testcase>
</testcases>
</codeblock>
