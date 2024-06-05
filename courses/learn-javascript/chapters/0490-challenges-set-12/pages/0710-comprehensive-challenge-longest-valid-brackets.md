Complete the JavaScript function to find the longest valid brackets.

For example:

```text
Input: str = "][][]]"

Output: 4

The longest valid bracket is "[][]"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const longestValidBrackets = str => {
  // Write your code here
}
</code>

<solution>
const longestValidBrackets = str => {
    const stack = [-1];
    return str.split('').reduce((max, char, i) => {
        if (char === "[") stack.push(i);
        else {
            stack.pop();
            if (stack.length === 0) stack.push(i);
            else max = Math.max(max, i - stack[stack.length - 1]);
        }
        return max;
    }, 0);
}
</solution>

<testcases>
<caller>
console.log(longestValidBrackets(str));
</caller>
<testcase>
<i>
const str = "";
</i>
</testcase>
<testcase>
<i>
const str = "[][][][[]]";
</i>
</testcase>
<testcase>
<i>
const str = "[][][[][][][]][][[]]";
</i>
</testcase>
</testcases>
</codeblock>
