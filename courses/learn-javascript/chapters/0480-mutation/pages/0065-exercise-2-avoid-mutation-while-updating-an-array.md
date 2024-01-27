Update the element at index **2** to be
**35** in the `originalArray` without
mutating it
and
store the resulting array in a variable
named `newArray`.

Log the value of `newArray`
to the console.
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const originalArray = [10, 20, 30, 40, 50];

// Write code below this line
</code>

<solution>
const originalArray = [10, 20, 30, 40, 50];

// Write code below this line
const newArray = [...originalArray.slice(0, 2), 35, ...originalArray.slice(3)];

console.log(newArray)
</solution>
</codeblock>
