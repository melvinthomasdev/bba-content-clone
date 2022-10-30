Follow the steps given below
to write a program:

1. Create a variable `dayOfTheWeek`
and
store the value `4` in it.

2. Use the `switch` statement
with the following **cases**
and
the corresponding **code blocks**:

| Case value | Code block                  |
| ---------- | --------------------------- |
| 1          | console.log("Sunday");      |
| 2          | console.log("Monday");      |
| 3          | console.log("Tuesday");     |
| 4          | console.log("Wednesday");   |
| 5          | console.log("Thursday");    |
| 6          | console.log("Friday");      |
| 7          | console.log("Saturday");    |
| default    | console.log("Invalid day!"); |

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let dayOfTheWeek = 4;
switch (dayOfTheWeek) {
  case 1:
    console.log("Sunday");
    break;
  case 2:
    console.log("Monday");
    break;
  case 3:
    console.log("Tuesday");
    break;
  case 4:
    console.log("Wednesday");
    break;
  case 5:
    console.log("Thursday");
    break;
  case 6:
    console.log("Friday");
    break;
  case 7:
    console.log("Saturday");
    break;
  default:
    console.log("Invalid day!");
    break;
}
</solution>
</Editor>