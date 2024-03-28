A Coding Day event was initially scheduled
for college students on November 15, 2024,
at 5:00 PM. However, due to exams, the event
had to be rescheduled to December 20, 2024,
at 6:00 PM.

Use the **Date** instance to capture the original
and rescheduled event date time.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const originalEventDateTime =

const rescheduledEventDateTime =

console.log(`The Coding Day Event that was planned for ${originalEventDateTime} has been rescheduled to ${rescheduledEventDateTime}.`);
</code>

<solution>
const originalEventDateTime = new Date("November 15, 2024 17:00:00");

const rescheduledEventDateTime = new Date("December 20, 2024 18:00:00");

console.log(`The Coding Day Event that was planned for ${originalEventDateTime} has been rescheduled to ${rescheduledEventDateTime}.`);
</solution>
</codeblock>
