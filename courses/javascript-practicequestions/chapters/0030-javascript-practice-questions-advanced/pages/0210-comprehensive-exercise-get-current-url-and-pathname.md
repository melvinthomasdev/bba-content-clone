The function `fetchURLDetails` should return the current URL and specific pathname in the format.

```
{
  currentUrl: <value>,
  pathname: <value>
}
```

1. No inputs are passed to the function.
2. Return stringified object.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const fetchURLDetails = () => {
  // your code here
}
</code>

<solution>
const fetchURLDetails = () =>
  JSON.stringify({
    currentUrl: window.location.href,
    pathname: window.location.pathname
  });
</solution>

<testcases>
<caller>
console.log(fetchURLDetails());
</caller>
<testcase>
<i>
// No inputs
</i>
</testcase>
</testcases>
</codeblock>