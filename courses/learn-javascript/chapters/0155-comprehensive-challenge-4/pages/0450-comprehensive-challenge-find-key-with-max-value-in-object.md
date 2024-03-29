Complete the JavaScript function to identify and return the key associated with the maximum value within the given object. The value should be a number.

For example:

```text
Input:
obj = {
    apple: 1,
    banana: 50,
    orange: 0,
    mango: -5
};

Output: banana
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getMaxKey = obj => {
  // write your code here
}
</code>

<solution>
const getMaxKey = obj => {
    let maxValue = -Infinity;
    let maxKey = null;

    for (const [key, value] of Object.entries(obj)) {
        if (value > maxValue) {
            maxValue = value;
            maxKey = key;
        }
    }

    return maxKey;

}

</solution>

<testcases>
<caller>
console.log(getMaxKey(obj))
</caller>
<testcase>
<i>
const obj = {
    apple: 10,
    banana: 5,
    orange: 20,
    mango: 15
};
</i>
</testcase>
<testcase>
<i>
const obj = {
    a: 5,
    b: 10,
    c: 8,
    d: 10
};
</i>
</testcase>
<testcase>
<i>
const obj = {
    a: Infinity,
    b: 0,
    c: 0,
    d: 10
};
</i>
</testcase>
</testcases>
</codeblock>
