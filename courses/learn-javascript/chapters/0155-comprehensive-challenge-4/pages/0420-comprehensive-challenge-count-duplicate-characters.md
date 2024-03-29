Complete the JavaScript function to count the occurrences of characters in a given string. The function should return an array containing objects representing each character and its occurrence count.

For example:

```text
Input: str = "bigbinary"
Output: { b: 2, i: 2, g: 1, n: 1, a: 1, r: 1, y: 1 }
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const countDuplicate = str => {
  // write your code here
}
</code>

<solution>
const countDuplicate = str => {

    const arr = {};

    for (let i = 0; i < str.length; i++) {

        if (Object.keys(arr).includes(str[i])) {
            arr[str[i]] = arr[str[i]] + 1;
            continue;
        }

        arr[str[i]] = 1;
    }
    return arr;

}

</solution>

<testcases>
<caller>
console.log(countDuplicate(str));
</caller>
<testcase>
<i>
const str = "apple";
</i>
</testcase>
<testcase>
<i>
const str = "macbook";
</i>
</testcase>
<testcase>
<i>
const str = "adsjfdsfsfjsdjfhacabcsbajda";
</i>
</testcase>
</testcases>
</codeblock>
