Display detailed information of the
**serverStartTime** object,
including the year, month, day, hours,
minutes, and seconds.
Use **console.log** to present the
output in the following format,

**Year: 2022, Month: 6, Day: 5, Hours: 8, Minutes: 45, Seconds: 30**

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const serverStartTime = new Date("June 5, 2022 08:45:30");
// Your code here
</code>

<solution>
const serverStartTime = new Date("June 5, 2022 08:45:30");
// Your code here
console.log(`Year: ${serverStartTime.getFullYear()}, Month: ${serverStartTime.getMonth() + 1}, Day: ${serverStartTime.getDate()}, Hours: ${serverStartTime.getHours()}, Minutes: ${serverStartTime.getMinutes()}, Seconds: ${serverStartTime.getSeconds()}`);
</solution>
</codeblock>
