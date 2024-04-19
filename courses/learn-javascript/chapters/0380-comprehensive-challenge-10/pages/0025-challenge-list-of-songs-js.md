Given is an array `songNames`
which is a list of song names:

Create a function `songNameOperations`
which accepts `songNames` array as a parameter
and does the following operations:

- Logs the longest name from the array
  to the console.
  If there are 2 names with the same length,
  it should return the first song name.

- Creates a new array from `songNames`
  where each element is the length of that
  song name and log the new array to the console.

- Create a new array which only contains
  song names with at least one vowel,
  and logs the array to the console.

- Create a new array that contains song
  names **NOT** starting with vowel and log
  the array to the console

For example:

```js
Input:
["Golmaal", "sukiyaki", "Hotel California", "Beat it", "Thriller"]
Output:
Longest name: "Hotel California"
Lengths array: [7, 8, 16, 7, 8]
Names with vowel: ["sukiyaki", "Hotel California", "Beat it"]
Names without first vowel: ["Golmaal", "Hotel California", "Beat it", "Thriller"]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>

const songNameOperations = songNames => {

const longestSongName = [...songNames].sort((a,b) => a.length - b.length).pop();

const songNameLength = songNames.map(name => name.length);

let songNamesWithVowel = songNames.filter((songName) => {
songName = songName.toLowerCase();
if (songName.includes('a' || 'e' || 'i' || 'o' || 'u')) {
return true;
} else {
return false
}
});

let namesWithoutFirstVowel = songNames.filter((word)=>{
if ( word.startsWith("a" || "e" || "i" || "o" || "u")) {
return false
} else {
return true
}
});

console.log(songNameLength);
console.log(songNamesWithVowel);
console.log(namesWithoutFirstVowel);
console.log(longestSongName);
}

</solution>
<testcases>
<caller>
songNameOperations(testSongNames);
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
<testcase>
<i>
const testSongNames = [
  "Golmaal",
  "sukiyaki",
  "Hotel California",
  "Beat it",
  "Thriller"
]
</i>
</testcase>
</testcases>
</codeblock>
