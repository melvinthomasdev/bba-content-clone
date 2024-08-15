Write a curried function that removes N names from the beginning of the given list.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const names = ["Mater", "Sally", "McQueen", "Guido", "Hudson"];

const removeTopN = //Complete this curried function

const removedOne = removeTopN(1);
const removedTwo = removeTopN(2);

console.log(removedOne); // ["Sally", "McQueen", "Guido", "Hudson"]
console.log(removedTwo); // ["McQueen", "Guido", "Hudson"]
</code>
<solution>
const names = ["Mater", "Sally", "McQueen", "Guido", "Hudson"];

const removeTopN = R.remove(0, R.__, names);

const removedOne = removeTopN(1);
const removedTwo = removeTopN(2);
console.log(removedOne);
console.log(removedTwo);
</solution>
</codeblock>
