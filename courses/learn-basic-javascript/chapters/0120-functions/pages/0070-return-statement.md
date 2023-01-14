Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const totalMarks1 = 81 + 90 + 72 + 99;
console.log(totalMarks1);

const totalMarks2 = 72 + 84 + 96 + 100;
console.log(totalMarks2);
</code>
</codeblock>

In the example given above:

- The expression `81 + 90 + 72 + 99`
  evaluates to `342`
  and
  that value is stored in `totalMarks1`.

- The expression `72 + 84 + 96 + 100`
  evaluates to `352`
  and
  that value is stored in `totalMarks2`.

Just like expressions can be
evaluated to a certain value,
we can also define functions
that result in a value.
In other words,
we can write functions
that **return** a value.

Let's rewrite the example given above,
to use a function `calculateSum`
that adds all the arguments passed to it
and
**returns** the sum.

<codeblock language="javascript" type="lesson">
<code>
const calculateSum = (number1, number2, number3, number4) => {
  const sumOfNumbers = number1 + number2 + number3 + number4;
  return sumOfNumbers;
}

const totalMarks1 = calculateSum(81, 90, 72, 99);
console.log(totalMarks1);

const totalMarks2 = calculateSum(72, 84, 96, 100);
console.log(totalMarks2);
</code>
</codeblock>

In the example given above:

- Inside the `calculateSum` function,
  the sum of all the arguments is calculated
  and
  stored in `sumOfNumbers`.

- The statement `return sumOfNumbers` indicates
  that a function call to `calculateSum`
  should return the value of `sumOfNumbers`.

- When `calculateSum(81, 90, 72, 99)` is invoked,
  the sum `342` is stored in `sumOfNumbers`
  and
  is then returned.
  The returned value is stored in `totalMarks1`.

- When `calculateSum(72, 84, 96, 100)` is invoked,
  the sum `352` is stored in `sumOfNumbers`
  and
  is then returned.
  The returned value is stored in `totalMarks2`.
