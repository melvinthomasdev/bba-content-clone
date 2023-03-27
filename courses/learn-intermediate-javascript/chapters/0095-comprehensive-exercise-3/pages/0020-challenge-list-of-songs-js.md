Given is a list of a few song names:

```javascript
[
  'paradise',
  'thriller',
  'havana',
  'cheerleader',
  'senorita',
  'rasputin',
  'baby',
  'sunflower'
]
```

- Write a function `findLongestSongName` that returns the longest name from the
  array. If there are 2 names with the same length, it should return the first
  occurrence.
- Write a function `findSongNameLength` which converts the above array into an
  array of length of word instead of word.
- Write a function `songNameContainingVowel` that create a new array which only
  contains song names with at least one vowel.
- Write a function `songNameWithoutFirstVowel` which creates a new array that
  contains song names NOT starting with vowel.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
const songNames = [
  'paradise',
  'thriller',
  'havana',
  'cheerleader',
  'senorita',
  'rasputin',
  'baby',
  'sunflower'
];

const findLongestSongName = array => { return [...array].sort((a,b) =>
a.length - b.length).pop(); };

const findSongNameLength = array => { return array.map(name => name.length); };

const songNameContainingVowel = array => { let songNamesWithVowel =
array.filter((songName)=>{ songName = songName.toLowerCase(); if(
songName.includes('a') || songName.includes('e') || songName.includes('i') ||
songName.includes('o') || songName.includes('u')) { return true } else { return
false } }); return songNamesWithVowel; };

const songNameWithoutFirstVowel = array => { let namesWithoutFirstVowel =
array.filter((word)=>{ if( word.startsWith("a") || word.startsWith("e") ||
word.startsWith("i") || word.startsWith("o") || word.startsWith("u")) { return
false }else{ return true } }); return namesWithoutFirstVowel; };

console.log(findLongestSongName(songNames));
console.log(findSongNameLength(songNames));
console.log(songNameContainingVowel(songNames));
console.log(songNameWithoutFirstVowel(songNames));

</solution>
<testcases>
<caller>
console.log(findLongestSongName(testSongNames));
console.log(findSongNameLength(testSongNames));
console.log(songNameContainingVowel(testSongNames));
console.log(songNameWithoutFirstVowel(testSongNames));
</caller>
<testcase>
<i>
const testSongNames = [
  "bailando",
  "alejandro",
  "california",
  "juicy",
  "whistle"
]
</i>
</testcase>
<testcase>
<i>
const testSongNames = [
  "bailamos",
  "astronaut",
  "stan",
  "fastlane",
  "sukiyaki"
]
</i>
</testcase>
</testcases>
</codeblock>
