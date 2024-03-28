Declare a function `formatElapsedSeconds` to
convert the given number of seconds to a format of `hours:minutes:seconds`.

If the input is `3670`, then the output should be `1:1:10`. This is because `3600` seconds is equal to `1` hour, and the remaining `70` seconds is equal to `1` minute and `10` seconds.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const formatElapsedSeconds = elapsedSeconds => {
  // write your code here
}
</code>

<solution>
const formatElapsedSeconds = elapsedSeconds => {
  const hours = Math.trunc(elapsedSeconds / 3600);
  const minutes = Math.trunc((elapsedSeconds / 60) % 60);
  const seconds = Math.trunc(elapsedSeconds % 60);
  return `${ hours }:${ minutes }:${ seconds }`;
}
</solution>

<testcases>
<caller>
console.log(formatElapsedSeconds(elapsedSeconds));
</caller>
<testcase>
<i>
const elapsedSeconds = 3670;
</i>
</testcase>
<testcase>
<i>
const elapsedSeconds = 670;
</i>
</testcase>
<testcase>
<i>
const elapsedSeconds = 545;
</i>
</testcase>
<testcase>
<i>
const elapsedSeconds = 50;
</i>
</testcase>
</testcases>
</codeblock>