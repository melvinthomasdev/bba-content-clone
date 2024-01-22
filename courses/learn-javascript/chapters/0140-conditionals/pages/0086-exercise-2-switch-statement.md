We have a variable `dayType`
with the value `Weekend`.

Implement a switch statement
with the following cases
and
messages to be displayed for each case:

| Case value | Message                                        |
| ---------- | ---------------------------------------------- |
| `Weekday`  | `It's a regular workday. Time to hustle!`      |
| `Weekend`  | `It's the weekend! Time to relax and unwind.`  |
| `Holiday`  | `Enjoy your holiday! Take a break.`            |
| `Vacation` | `You're on vacation! Make the most of it.`     |

If none of the cases match,
display **"Not sure about this day type."**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const dayType = "Weekend";
// Write your code below this line
</code>

<solution>
const dayType = "Weekend";
// Write your code below this line

switch (dayType) {
  case "Weekday":
    console.log("It's a regular workday. Time to hustle!");
    break;

  case "Weekend":
    console.log("It's the weekend! Time to relax and unwind.");
    break;

  case "Holiday":
    console.log("Enjoy your holiday! Take a break.");
    break;

  case "Vacation":
    console.log("You're on vacation! Make the most of it.");
    break;

  default:
    console.log("Not sure about this day type.");
    break;
}
</solution>
</codeblock>