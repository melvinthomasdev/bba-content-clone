The `for` loop given below,
displays all the elements
of the array `fruits`.
Use a `break` statement
in the loop such that
**"Banana"** and all the
following elements are not displayed.

```js
Output:
"Apple"
"Kiwi"
"Mango"
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const fruits = ["Apple", "Kiwi", "Mango", "Banana", "Orange", "Watermelon"];

for (let index = 0; index < 6; index++) {
  console.log(fruits[index]);
}
</code>

<solution>
const fruits = ["Apple", "Kiwi", "Mango", "Banana", "Orange", "Watermelon"];

for (let index = 0; index < 6; index++) {
  if (fruits[index] === "Banana") {
    break;
  }
  console.log(fruits[index]);
}
</solution>
</codeblock>
