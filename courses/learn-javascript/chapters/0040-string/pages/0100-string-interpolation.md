We can insert the values of variables
into a template string using
the `${}` notation. This is
known as **string interpolation**.

<codeblock language="javascript" type="lesson">
<code>
const totalIncome = 60000;
const totalExpense = 36000;

console.log(`Your balance is ${totalIncome - totalExpense}`);
</code>
</codeblock>

In the example given above,
we are using string interpolation
to insert the value of an **expression**
into a template string.
