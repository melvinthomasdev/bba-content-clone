Update the month of the `createDate` object to **January**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const createDate = new Date("July 4, 2014");
console.log(createDate);
</code>

<solution>
const createDate = new Date("July 4, 2014");
createDate.setMonth(0);
console.log(createDate);
</solution>
</codeblock>