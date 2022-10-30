Complete the function definition below.

Given a input string, the function should find the hexadecimal value present in it and return the decimal value of the same.

1. The string input given may contain a suffix string.
2. If value does not contain a hexaDecimal, the function should return 0.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function FindHexNumber(value){
    // write your code here
  }
</code>

<solution>
function FindHexNumber(value){
	  return (Number.isNaN(parseInt(value, 16)) ? 0 : parseInt(value, 16));
  }
</solution>

<testcases>
<caller>
console.log(FindHexNumber(value));
</caller>
<testcase>
<i>
const value = 'e82f bit';
</i>
</testcase>
<testcase>
<i>
const value = '79ed bits';
</i>
</testcase>
<testcase>
<i>
const value = 'nothinghere bits';
</i>
</testcase>
<testcase>
<i>
const value = '84f7 bits';
</i>
</testcase>
</testcases>
</Editor>