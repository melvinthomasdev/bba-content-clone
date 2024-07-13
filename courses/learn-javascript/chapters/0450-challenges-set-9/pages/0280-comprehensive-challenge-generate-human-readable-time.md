Complete the JavaScript function to generate the human-readable format in the given number of milliseconds.

For example:

```text
Input: ms = 60000

Output: 1 minute
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const formatDuration = ms => {
  // Write your code here
}
</code>

<solution>
const formatDuration = ms => {
  if (ms < 0) ms = -ms;
  const time = {
    day: Math.floor(ms / 86400000),
    hour: Math.floor(ms / 3600000) % 24,
    minute: Math.floor(ms / 60000) % 60,
    second: Math.floor(ms / 1000) % 60,
    millisecond: Math.floor(ms) % 1000
  };

  return Object.entries(time)
    .filter(val => val[1] !== 0)
    .map(val => val[1] + ' ' + (val[1] !== 1 ? val[0] + 's' : val[0]))
    .join(', ');
};
</solution>

<testcases>
<caller>
console.log(formatDuration(ms));
</caller>
<testcase>
<i>
const ms = 1001;
</i>
</testcase>
<testcase>
<i>
const ms = 34325055574;
</i>
</testcase>
</testcases>
</codeblock>
