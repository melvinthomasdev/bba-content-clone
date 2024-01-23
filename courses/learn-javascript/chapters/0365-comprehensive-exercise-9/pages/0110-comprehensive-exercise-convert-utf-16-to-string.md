The function `convertToString` should return characters created from the given sequence of UTF-16 [code units](https://developer.mozilla.org/en-US/docs/Glossary/Code_unit#:~:text=A%20character%20encoding%20system%20uses,on%20these%2016%2Dbit%20units.).

1. There could be any number of inputs with a minimum of 1.
2. Return the final string.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const convertToString = codes => // your code here
</code>

<solution>
const convertToString = codes => String.fromCharCode(...codes)
</solution>

<testcases>
<caller>
console.log(convertToString(codes));
</caller>
<testcase>
<i>
const codes = [73, 20, 76, 111, 118, 101, 20, 74, 83];
</i>
</testcase>
<testcase>
<i>
const codes = [66, 105, 103, 20, 66, 105, 110, 97, 114, 121];
</i>
</testcase>
<testcase>
<i>
const codes = [22, 45, 103, 20, 66, 82, 110, 97, 200, 121];
</i>
</testcase>
<testcase>
<i>
const codes = [82, 33, 101, 111, 66, 105, 333, 97, 114, 666];
</i>
</testcase>
</testcases>
</codeblock>