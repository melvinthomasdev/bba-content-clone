You have a project deadline set
for **November 15, 2024**,
at **5:00 PM**, stored in the
**projectDeadline** variable.
Due to some delays, you need to
change the deadline to
**December 20, 2024**, at **6:00 PM**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const projectDeadline = new Date("November 15, 2024 17:00:00");
// Add your code below this line

// Add your code above this line
console.log(projectDeadline);
</code>

<solution>
const projectDeadline = new Date("November 15, 2024 17:00:00");
// Add your code below this line

projectDeadline.setMonth(11);
projectDeadline.setDate(20);
projectDeadline.setHours(18);

// Add your code above this line
console.log(projectDeadline);
</solution>
</codeblock>
