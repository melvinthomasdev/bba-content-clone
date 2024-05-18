Complete the JavaScript function to print the unique elements present in the two arrays. The function should return an array.

For example:

```text
Input: arr1 = [10, 20, 30], arr2 = [10, 5, 0]
Output: [ 20, 30, 5, 0 ]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findUnique = (arr1, arr2) => {
  // write your code here
}
</code>

<solution>
const findUnique = (arr1, arr2) => {
    const newArrayOne = arr1.filter((item) => arr2.indexOf(item) === -1);
    const newArrayTwo = arr2.filter((item) => arr1.indexOf(item) === -1);

    const uniqueArray = newArrayOne.concat(newArrayTwo);
    return uniqueArray;

}

</solution>

<testcases>
<caller>
console.log(findUnique(arr1, arr2));
</caller>
<testcase>
<i>
const arr1 = [54, 71, 58, 95, 20];
const arr2 = [71, 51, 54, 33, 58];
</i>
</testcase>
<testcase>
<i>
const arr1 = [1, 2, 3, 4, 5];
const arr2 = [1, 2, 4, 3, 7];
</i>
</testcase>
<testcase>
<i>
const arr1 = [1, 2, 3, 4, 5];
const arr2 = [3, 4, 5, 6, 7, 1];
</i>
</testcase>
</testcases>
</codeblock>
