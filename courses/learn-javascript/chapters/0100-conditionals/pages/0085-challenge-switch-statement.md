We have a variable `number`
with the value `3`.
Add a **switch** statement,
with the following cases
and the messages to be displayed
for each case:

| Case value | Message            |
| ---------- | ------------------ |
| 1          | "This is number 1" |
| 2          | "This is number 2" |
| 3          | "This is number 3" |

If none of the cases match,
display **"This is an invalid number"**.

For example:
```js
Input: number = 4

Output: "This is an invalid number"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const number = 3;
</code>

<solution>
const number = 3;

switch (number) {
  case 1:
    console.log("This is number 1");
    break;

  case 2:
    console.log("This is number 2");
    break;

  case 3:
    console.log("This is number 3");
    break;

  default:
    console.log("This is an invalid number");
    break;
}
</solution>
</codeblock>
