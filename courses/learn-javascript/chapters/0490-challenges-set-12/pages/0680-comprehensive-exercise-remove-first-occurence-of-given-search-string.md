Complete the JavaScript function to remove the first occurrence of a given search string from a string.

For example:

```text
Input: str = "The quick brown fox jumps over the lazy dog", searchStr = "the"

Output: The quick brown fox jumps over  lazy dog
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const removeFirstOccurrence = (str, searchStr) => {
  // Write your code here
}
</code>

<solution>
const removeFirstOccurrence = (str, searchStr) => {
    const index = str.indexOf(searchStr);
    if (index === -1) return str;

    return str.slice(0, index) + str.slice(index + searchStr.length);

}

</solution>

<testcases>
<caller>
console.log(removeFirstOccurrence(str, searchStr));
</caller>
<testcase>
<i>
const str = "Programming is fun, programming is challenging, programming is rewarding";
const searchStr = "programming";
</i>
</testcase>
<testcase>
<i>
const str = "Hello world, hello universe";
const searchStr = "hello";
</i>
</testcase>
</testcases>
</codeblock>
