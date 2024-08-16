You are provided with two functions that need to handle different sets of arguments. Your goal is to modify these functions to achieve specific outputs based on the given requirements.

Modify the `logMessages` function to handle a varying number of message inputs.
If the function receives more than three messages, print, **[Person's Name] has sent a detailed message.** Otherwise, print, **[Person's Name] has sent a brief message.**
The first argument passed to the function will always be the person's name, followed by the messages.

Modify the `calculateAverage` function to accept an array of grades and log the average grade.
Ensure that you can pass the grades as separate arguments when calling the function.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
<panel language="javascript">
// Write your code below

// Modify the logMessages function
const logMessages = () => {

};

// Modify the calculateAverage function
const calculateAverage = () => {

};

</panel>
</code>

<solution>
const logMessages = (name, ...messages) => {
  if (messages.length > 3) {
    console.log(`${name} has sent a detailed message.`);
  } else {
    console.log(`${name} has sent a brief message.`);
  }
};

const calculateAverage = (...grades) => {
const total = grades.reduce((sum, grade) => sum + grade, 0);
const average = total / grades.length;
console.log(`The average grade is: ${average.toFixed(2)}`);
};

</solution>

<testcases>
<caller>
logMessages(name, ...otherMessages);
calculateAverage(...grades);
</caller>
<testcase>
<i>
const name = "Alice";
const otherMessages = ["Project completed", "Awaiting feedback", "Meeting scheduled"];
const grades = [90, 85, 88];
</i>
</testcase>
<testcase>
<i>
const name = "Bob";
const otherMessages = ["Assignment submitted", "Test scores updated", "Extra credit approved", "Need assistance with project"];
const grades = [72, 75, 78, 80]
</i>
</testcase>
<testcase>
<i>
const name = "Eve";
const otherMessages = ["Initial draft ready", "Team meeting scheduled"];
const grades = [78, 82, 85];
</i>
</testcase>
<testcase>
<i>
const name = "Smith";
const otherMessages = ["Idea brainstormed", "Outline created", "Feedback received", "Draft revised"];
const grades = [88, 92, 84, 91];
</i>
</testcase>
</testcases>
</codeblock>

We are not displaying the answer for this challenge.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
