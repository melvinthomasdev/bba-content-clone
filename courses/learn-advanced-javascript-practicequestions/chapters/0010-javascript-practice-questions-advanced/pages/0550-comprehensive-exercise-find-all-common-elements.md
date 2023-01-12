The function `commonElements` should return the common elements.

1. If either one of the arrays is empty, return the non-empty array.
2. Return stringified object.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const commonElements = ({ arr1, arr2 }) => {
  // your code here
}
</code>

<solution>
const commonElements = ({ arr1, arr2 }) => {
  if (arr1.length === 0) return JSON.stringify(arr2);

  if (arr2.length === 0) return JSON.stringify(arr1);

  return JSON.stringify(arr1.filter((el) => arr2.includes(el)));
};
</solution>

<testcases>
<caller>
console.log(commonElements({ arr1, arr2 }));
</caller>
<testcase>
<i>
const arr1 = [1, 2, 3, 5];
const arr2 = [1, 2, 3, 4, 5];
</i>
</testcase>
<testcase>
<i>
const arr1 = ["apple", "banana", "orange", "kiwi"];
const arr2 = ["banana", "kiwi"];
</i>
</testcase>
<testcase>
<i>
const arr1 = ["miami", "pune", "kochi"];
const arr2 = [];
</i>
</testcase>
<testcase>
<i>
const arr1 = [];
const arr2 = [
  "bravo",
  "india",
  "golf",
  "bravo",
  "india",
  "november",
  "alfa",
  "romeo",
  "yankee",
];
</i>
</testcase>
</testcases>
</codeblock>