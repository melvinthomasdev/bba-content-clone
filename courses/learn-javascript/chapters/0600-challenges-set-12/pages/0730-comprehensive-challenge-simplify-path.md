Complete the JavaScript function to convert an absolute file path in a Unix-style file system to a simplified canonical path.

In Unix-style file system context, a single period `.` signifies the current directory, a double period `..` denotes moving up one directory level, and multiple slashes such as `//` are interpreted as a single slash. In this problem, treat sequences of periods not covered by the previous rules (like `...`) as valid names for files or directories.

For example:

```text
Input: path = "/home/user/Documents/../Pictures"

Output: "/home/user/Pictures"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const simplifyPath = path => {
  // Write your code here
}
</code>

<solution>
const simplifyPath = path => {
    return '/' + path.split('/').reduce((stack, segment) => {
        if (segment === '..') stack.pop();
        else if (segment && segment !== '.') stack.push(segment);
        return stack;
    }, []).join('/');
}
</solution>

<testcases>
<caller>
console.log(simplifyPath(path));
</caller>
<testcase>
<i>
const path = "/a/../../b/../c//.//";
</i>
</testcase>
<testcase>
<i>
const path = "/../";
</i>
</testcase>
<testcase>
<i>
const path = "/a//b////c/d//././/..";
</i>
</testcase>
</testcases>
</codeblock>
