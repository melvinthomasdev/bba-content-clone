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

<Editor lang="sql" dbName="clean-slate.db">
<code>
select 8 % 2;
</code>
</Editor>


While dividing numbers
    7 and 2,
results in a remainder of
    1

So 7 is an odd number.

<Editor lang="sql" dbName="clean-slate.db">
<code>
select 7 % 2;
</code>
</Editor>

## Example

Find all student ids which are even.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT id FROM students WHERE id % 2 = 0
</code>
</Editor>