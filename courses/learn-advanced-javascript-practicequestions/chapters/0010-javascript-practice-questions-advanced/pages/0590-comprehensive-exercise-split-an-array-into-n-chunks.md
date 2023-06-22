The function `splitArray` should return sub-arrays, where each of their maximum length should be equal to `maxlen` parameter passed as one of the input.

1. Do **not** use any loop. Only higher order functions like `map`, `filter` etc are allowed.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const splitArray = ({ arr, maxlen }) => {
  // your code here
};
</code>

<solution>
const splitArray = ({ arr, maxlen }) => {
  const tempArr = [...arr]
  let numberOfChunks = Math.ceil(arr.length / maxlen);
  let result = [];
  Array.apply(null, { length: numberOfChunks })
    .map(Number.call, Number)
    .forEach(() => {
      result.push(tempArr.splice(0, maxlen));
    });
  return result;
};
</solution>

<testcases>
<caller>
console.log(splitArray({ arr,maxlen }));
</caller>
<testcase>
<i>
const arr = [1, 2, 3, 4, 5, 6];
const maxlen = 3;
</i>
</testcase>
<testcase>
<i>
const arr = [1, 2, 3, 4, 5, 6];
const maxlen = 2;
</i>
</testcase>
<testcase>
<i>
const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
const maxlen = 4;
</i>
</testcase>
</testcases>
</codeblock>