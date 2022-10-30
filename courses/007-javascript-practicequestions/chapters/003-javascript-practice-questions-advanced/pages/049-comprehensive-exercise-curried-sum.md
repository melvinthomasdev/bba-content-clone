Find the curried sum

1. Function accepts paramets a, b, c, d
2. In the form of fn(a)(b)(c)(d)

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const sum = () => {
  // your code here
};
</code>

<solution>
const sum = function (a) {
  return function (b) {
    return function (c) {
      return function (d) {
        return a + b + c + d;
      };
    };
  };
};
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
</testcases>
</Editor>