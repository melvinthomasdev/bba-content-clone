Convert the given array of array of numbers to array of sum.

1. Input will be an array, which have another array at each index.
2. The inner array will contain numbers.
3. Calculate the sum of numbers in each array and return an array with the sum at the same index.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function sum(list){
  // write your code here
}
</code>

<solution>
function sum(list){
  return list.map((numbers) => {
    return numbers.reduce((sum, number) => {
      return sum + number;
    }, 0);
  });
}
</solution>

<testcases>
<caller>
console.log(sum(list));
</caller>
<testcase>
<i>
const list = [[3, 4], [10, 20], [12, 13], [14, 17], [19, 20]];
</i>
</testcase>
<testcase>
<i>
const list = [[9, 2, 12], [12, 233, 98, 87], [65, 43, 12, 13], [87, 114, 179, 786], [234, 34, 19, 20]];
</i>
</testcase>
<testcase>
<i>
const list = [[19, 12], [34, 545, 65, 654], [43, 98, 90]];
</i>
</testcase>
<testcase>
<i>
const list = [[19, 12], [34, 545, 65, 654], [43, 98, 90], []];
</i>
</testcase>
<testcase>
<i>
const list = [[3, 4], [], [12, 13], [14, 17], [19, 20]];
</i>
</testcase>
<testcase>
<i>
const list = [[23, 4], [10, 20], [12, 13], [14, 17], [19, 20]];
</i>
</testcase>
</testcases>
</Editor>