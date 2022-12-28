Follow the steps given below
to write a program:

1. Create a variable `dayOfTheWeek`
   and store the number `4` in it.

2. Using the `switch` statement,
   for the value
   given in the first column,
   display the message
   given in the second column:

   | Value | Message     |
   | ----- | ----------- |
   | 1     | "Sunday"    |
   | 2     | "Monday"    |
   | 3     | "Tuesday"   |
   | 4     | "Wednesday" |
   | 5     | "Thursday"  |
   | 6     | "Friday"    |
   | 7     | "Saturday"  |

3. If none of the values match,
   display **"Invalid day!"**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const dayOfTheWeek = 4;
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
</codeblock>