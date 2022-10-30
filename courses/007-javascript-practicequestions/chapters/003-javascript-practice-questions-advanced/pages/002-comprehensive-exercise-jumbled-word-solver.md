The function, should return the solution to the jumbled words passed to it.

1. The 'sampleDictionary' might or might not contain the correct word.
2. If the solution is not present in 'sampleDictionary', then return false

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const solveJumbledWords = (word, sampleDictionary) => {
// your code here
}
</code>

<solution>
const solveJumbledWords = (word, sampleDictionary) => {
  const sortedWord = word.toLowerCase().split('').sort().join('');
  let finalWord = false;
  for (let i = 0; i < sampleDictionary.length; i++) {
      const tempSortedWord = sampleDictionary[i].toLowerCase().split('').sort().join('');
      if (tempSortedWord === sortedWord) {
        finalWord = sampleDictionary[i];
        break;
      }
  };
  return finalWord;
}
</solution>

<testcases>
<caller>
console.log(solveJumbledWords(word, sampleDictionary));
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
</Editor>