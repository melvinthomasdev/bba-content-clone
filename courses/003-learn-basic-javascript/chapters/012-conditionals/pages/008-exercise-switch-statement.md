We have a variable `number` with the value `3`. Add a **switch** statement, with the following cases and corresponding code blocks:

| Case value | Code block                                |
| ---------- | ----------------------------------------- |
| 1          | console.log("This is number 1");          |
| 2          | console.log("This is number 2");          |
| 3          | console.log("This is number 3");          |
| default    | console.log("This is an invalid number"); |

<Editor type="exercise" lang="javascript">
<code>
let number = 3;
</code>

<solution>
let number = 3;
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
</Editor>