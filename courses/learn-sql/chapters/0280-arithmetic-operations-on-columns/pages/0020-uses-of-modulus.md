One of the uses of *Modulus* is to detect if a number is even or odd.

If a number is evenly divisible by 2 leaving a remainder of zero then
the number is even.

If the number is not evenly divisible by 2 and leaves a remainder of 1 then it is an
odd number.

For example when dividing numbers say
    8 and 2
results in a remainer of
    0

So 8 is an even number.

<codeblock language="sql" dbName="clean-slate.db" type="lesson">
<code>
select 8 % 2;
</code>
</codeblock>


While dividing numbers
    7 and 2,
results in a remainder of
    1

So 7 is an odd number.

<codeblock language="sql" dbName="clean-slate.db" type="lesson">
<code>
select 7 % 2;
</code>
</codeblock>

## Example

Find all student ids which are even.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT id FROM students WHERE id % 2 = 0
</code>
</codeblock>