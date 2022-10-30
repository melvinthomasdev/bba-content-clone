Find the sum of all odd numbers until n.

1. Input will be the limit n.
2. Return the sum of all the odd numbres until n.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function sumOfOddNumbers(n){
  // write your code here
}
</code>

<solution>
function sumOfOddNumbers(n){
  let i = 1;
  let sum = 0;
  do {
    sum += i;
    i += 2;
  } while (i <= n);
  return sum;
}
</solution>

<testcases>
<caller>
console.log(sumOfOddNumbers(n));
</caller>
<testcase>
<i>
const n = 100;
</i>
</testcase>
<testcase>
<i>
const n = 34;
</i>
</testcase>
<testcase>
<i>
const n = 25;
</i>
</testcase>
<testcase>
<i>
const n = 159;
</i>
</testcase>
<testcase>
<i>
const n = 200;
</i>
</testcase>
<testcase>
<i>
const n = 10;
</i>
</testcase>
</testcases>
</Editor>