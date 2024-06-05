You are given an array of intervals representing the start and end of each interval. Complete the Javascript function to merge all overlapping intervals and return an array of the merged intervals.

For example:

```text
Input: intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]

Output: [[1, 6], [8, 10], [15, 18]]

In the given intervals we have only two overlapping intervals [1, 3] and [2, 6]. Therefore we will merge these two and return [[1, 6], [8, 10], [15, 18]].
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const mergeIntervals = intervals => {
  // Write your code here
}
</code>

<solution>
const mergeIntervals = intervals => {
    if (intervals.length <= 1) return intervals;

    const sortedIntervals = intervals.sort((a, b) => a[0] - b[0]);

    return sortedIntervals.reduce((merged, interval) => {
        if (merged.length === 0 || merged[merged.length - 1][1] < interval[0]) {
            merged.push(interval);
        } else {
            merged[merged.length - 1][1] = Math.max(merged[merged.length - 1][1], interval[1]);
        }
        return merged;
    }, []);
}
</solution>

<testcases>
<caller>
console.log(mergeIntervals(intervals));
</caller>
<testcase>
<i>
const intervals = [[1, 3], [2, 4], [6, 8], [9, 10]];
</i>
</testcase>
<testcase>
<i>
const intervals = [[1, 2], [2, 3], [3, 4], [4, 5]];
</i>
</testcase>
<testcase>
<i>
const intervals = [[1, 2]];
</i>
</testcase>
</testcases>
</codeblock>
