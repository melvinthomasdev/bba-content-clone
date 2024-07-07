You are given an array of integers citations, where `citations[i]` is the number of citations a researcher received for their `ith` paper. Complete the Javascript function and return the researcher's `h-index`.

The `h-index` is defined as the maximum value of `h` such that the given researcher has published at least `h` papers that have each been cited at least `h` times.

For example:

```text
Input: citations = [0, 1, 3, 5, 6]

Output: 3

The researcher has 5 papers with citations [0, 1, 3, 5, 6].
The H-Index is 3 since the researcher has 3 papers (papers 3, 4, and 5) that have at least 3 citations each.
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const hIndex = citations => {
  // Write your code here
}
</code>

<solution>
const hIndex = citations => {
  citations.sort((a, b) => b - a);
  let count = 0;

  while (citations[count] > count) count++;

  return count;
};
</solution>

<testcases>
<caller>
console.log(hIndex(citations));
</caller>
<testcase>
<i>
const citations = [3, 0, 6, 1, 5];
</i>
</testcase>
<testcase>
<i>
const citations = [5, 4, 2, 1, 1];
</i>
</testcase>
<testcase>
<i>
const citations = [1, 1, 1, 1, 1];
</i>
</testcase>
</testcases>
</codeblock>
