Write a function `findPerfectSquare` that 
takes a number as input and returns 
`true` if the number is a perfect square. 
Otherwise, it should return `false`.

A perfect square is a number 
that can be expressed as the product 
of an integer with itself. 

For example, 
`4 = 2 * 2, 9 = 3 * 3, 100 = 10 * 10`. Here, 
**4**, **9** and **100** are perfect squares.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code below this line
</code>
<solution>
// Write code below this line

function findPerfectSquare(n) {
  const isPerfectSquare = (Math.sqrt(n) % 1 === 0)
  return isPerfectSquare;
}

</solution>
<testcases>
<caller>
console.log(findPerfectSquare(testNumber));
</caller>
<testcase>
<i>
const testNumber = 16;
</i>
</testcase>
<testcase>
<i>
const testNumber = 82;
</i>
</testcase>
<testcase>
<i>
const testNumber = 91;
</i>
</testcase>
<testcase>
<i>
const testNumber = 25;
</i>
</testcase>
</testcases>
</codeblock>
