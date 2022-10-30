The function `fetchURLDetails` should return the current url and specific pathname in the format.

```
{
  currentUrl: <value>,
  pathname: <value>
}
```

1. No inputs are passed to the function.
2. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function fetchURLDetails() {
  // your code here
}
</code>

<solution>
function fetchURLDetails() {
  return JSON.stringify({
    currentUrl: window.location.href,
    pathname: window.location.pathname
  });
}
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
</Editor>