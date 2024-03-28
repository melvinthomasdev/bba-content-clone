Determine the position of the word "Nemo" and return a string in the following manner: "I found Nemo at [position of the word nemo]!"

1. If there are multiple instances of the word, return the string for the first occurence.
2. If you can't find Nemo, return "I can't find Nemo :(".

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findNemo = str => {
  // your code here
}
</code>

<solution>
const findNemo = str => {
	const position = str.split(" ").indexOf('Nemo') + 1;
  return position ? `I found Nemo at ${position}!` : "I can't find Nemo :("
}
</solution>

<testcases>
<caller>
console.log(findNemo(str));
</caller>
<testcase>
<i>
const str = "I Nemo am";
</i>
</testcase>
<testcase>
<i>
const str = "I am Dory";
</i>
</testcase>
<testcase>
<i>
const str = "I am finding Nemo !";
</i>
</testcase>
<testcase>
<i>
const str = "I am Nemo the real Nemo";
</i>
</testcase>
</testcases>
</codeblock>