The function `addSuffix` should return an anonymous function, which transforms its input by adding a particular suffix at the end. Whereas the function `printSuffixed` should return this suffixed string.

1. Do not modify the function names.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const addSuffix = () => {
  // your code here
};
const printSuffixed = ({ suffix, str }) => {
  // your code here
};
</code>

<solution>
const addSuffix = suffix => str => `${str}${suffix}`;

const printSuffixed = ({ suffix, str }) => addSuffix(suffix)(str)
</solution>

<testcases>
<caller>
console.log(printSuffixed({ suffix, str }));
</caller>
<testcase>
<i>
const str = "quick";
const suffix = "ly";
</i>
</testcase>
<testcase>
<i>
const str = "total";
const suffix = "ly";
</i>
</testcase>
<testcase>
<i>
const str = "fear";
const suffix = "less";
</i>
</testcase>
<testcase>
<i>
const str = "ruth";
const suffix = "less";
</i>
</testcase>
<testcase>
<i>
const str = "joy";
const suffix = "ous";
</i>
</testcase>
</testcases>
</codeblock>