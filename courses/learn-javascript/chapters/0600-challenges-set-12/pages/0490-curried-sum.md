Find the curried sum

1. The `sum` function accepts parameters `a`, `b`, `c`, and `d` in the form of `fn(a)(b)(c)(d)`.

For example:
```js
Input:
const a = 10;
const b = 20;
const c = 30;
const d = 40;

Output:
100
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sum = () => {
  // your code here
};
</code>

<solution>
/* Using function keyword
const sum = (a) => {
  function (b) {
    return function (c) {
      return function (d) {
        return a + b + c + d;
      };
    };
  };
};
*/

// Using arrow function (Preferred)
const sum = a => b => c => d => a + b + c + d;
</solution>

<testcases>
<caller>
console.log(sum(a)(b)(c)(d));
</caller>
<testcase>
<i>
const a = 10;
const b = 20;
const c = 30;
const d = 40;
</i>
</testcase>
<testcase>
<i>
const a = 5;
const b = 10;
const c = 15;
const d = 20;
</i>
</testcase>
<testcase>
<i>
const a = 110;
const b = 220;
const c = 300;
const d = 500;
</i>
</testcase>
<testcase>
<i>
const a = 220;
const b = 180;
const c = 50;
const d = 120;
</i>
</testcase>
</testcases>
</codeblock>
