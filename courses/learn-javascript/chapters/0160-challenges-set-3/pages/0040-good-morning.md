Update the function, **goodMorning**, to make sure it returns **Good** if the given number is divisible by 3, **Morning** if divisible by 5, **Good Morning** if divisible by both, else return the number itself.

For example:
```js
Input: number = 15

Output: "Good Morning"
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const goodMorning = (number) => {
    // write your code here
}
</code>

<solution>
const goodMorning = (number) => {
  if (number % 3 === 0 && number % 5 === 0) {
    return 'Good Morning';
  } else if (number % 3 === 0) {
    return 'Good';
  } else if (number % 5 === 0) {
    return 'Morning';
  } else {
    return number;
  }
}
</solution>
<testcases>
<caller>
console.log(goodMorning(number));
</caller>
<testcase>
<i>
const number = 5;
</i>
</testcase>
<testcase>
<i>
const number = 15;
</i>
</testcase>
<testcase>
<i>
const number = 25;
</i>
</testcase>
<testcase>
<i>
const number = 22;
</i>
</testcase>
</testcases>
</codeblock>
