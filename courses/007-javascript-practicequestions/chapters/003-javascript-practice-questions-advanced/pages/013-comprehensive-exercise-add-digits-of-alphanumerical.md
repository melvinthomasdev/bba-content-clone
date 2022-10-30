Given an alphanumerical value as input, return the sum of all its digits.

1. If present, non-numerical values will only be a suffix to all the digits.
2. If no numerical value is present, return false

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const findSumOfDigits = (alphaNumeric) => {
  // your code here
}
</code>

<solution>
const findSumOfDigits = (alphaNumeric) => {
    const digits = parseInt(alphaNumeric);
    if (digits) {
        return digits.toString().split('').map(Number).reduce((a,b) => a + b, 0);
    }
    return false
}
</solution>

<testcases>
<caller>
console.log(findSumOfDigits(alphaNumeric));
</caller>
<testcase>
<i>
const alphaNumeric = '0987654321abcdefgh';
</i>
</testcase>
<testcase>
<i>
const alphaNumeric = '42JohnDoe';
</i>
</testcase>
<testcase>
<i>
const alphaNumeric = '221BBakerStreet';
</i>
</testcase>
<testcase>
<i>
const alphaNumeric = 'JamesBond';
</i>
</testcase>
</testcases>
</Editor>