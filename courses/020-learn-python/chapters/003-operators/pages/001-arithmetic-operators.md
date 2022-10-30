Python supports a huge variety of operators which can work on multiple data types. For example we have already seen the `+`, `-`, `*`, `/` operators in action when we discussed numbers in the previous chapter.

Let's learn about a few more of them.

## The Modulo Operator
The modulo operator is used to find the remainder in a division operation.

<Editor lang="python">
<code>
print(24 % 10)
print(5 % 3)
</code>
</Editor>

## Exponent Operator
The exponent operator is represented by `**`. It takes in two operands. This operator can be used to raise a number to that of another number.
The exponent operator essentially multiples a number by itself, for the given `power` of times.

For example the operation 5³ is performed in python by using `5**3`.

<Editor lang="python">
<code>
print(5 ** 3)
</code>
</Editor>


## Floor Division Operator
The floor division operator, as the name suggests, rounds up the result of a division operator to the lower integer value. It can be used on Integers as well as Floats.

For example the result of 5 / 2 is 2.5. However, if we use the floor divison operator, Python will discard the decimal part of the result and just print 2.

<Editor lang="python">
<code>
print(25 / 10)
print(25 // 10)
</code>
</Editor>