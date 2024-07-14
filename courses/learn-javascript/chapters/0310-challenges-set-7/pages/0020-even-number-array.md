You are given an array `arrayOfStrings`. Create a function `getEvenStrings` that,

- Accepts `arrayOfStrings` as a parameter.
- Creates a new array containing only the strings with even lengths.
- Logs the new array to the console.

For example:
```js
Input: arrayOfStrings = ["Ragdoll", "Persian", "Sphynx", "Dalmatian", "German Shepherd", "Pitbull"];

Output: ["Sphynx"]
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
function getEvenStrings(arrayOfStrings) {
  const evenStrings = arrayOfStrings.filter(str => str.length % 2 === 0);
  console.log(evenStrings);
}

</solution>
<testcases>
<caller>
getEvenStrings(arrayOfStrings);
</caller>
<testcase>
<i>
const arrayOfStrings = ["Ragdoll", "Persian", "Sphynx", "Dalmatian", "German Shepherd", "Pitbull"];
</i>
</testcase>
<testcase>
<i>
const arrayOfStrings = ["Stingray", "Clownfish", "Shark", "Rattlesnake", "Cobra", "Python"];
</i>
</testcase>
<testcase>
<i>
const arrayOfStrings = ["Grizzly Bear", "Black Bear", "Polar Bear", "White Tiger", "Royal Bengal Tiger", "Siberian Tiger"];
</i>
</testcase>
</testcases>
</codeblock>
