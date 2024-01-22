The `reduce()` method invokes a function
on each element of the array.
The value returned by one invocation
is passed as argument to the next.

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 4, 5];

const calculateSum = (accumulator, currentValue) => accumulator + currentValue;

const sum = numbers.reduce(calculateSum, 0);
console.log(sum);
</code>
</codeblock>

In the above example:

- The function `calculateSum` passed as the
  first argument to `reduce()`
  is invoked on all elements of `numbers`.
  The second argument of `reduce()` is usually
  referred to as the **initial value**.

- When `calculateSum` is first invoked,
  the first argument passed to `calculateSum`
  is the initial value - `0`.
  The second argument passed to `calculateSum`
  is the first element of `numbers`, i.e., `1`.

- In subsequent invocations of `calculateSum`,
  the first argument will be
  the value returned by the previous invocation.
  The second argument will be
  subsequent elements of the `numbers` array.

- The value returned by the
  last invocation will be the value
  returned by the `reduce()` method.

The function passed as the first argument
to the `reduce()` method can accept four arguments:

1. Stores the value returned
   from the previous function call.

2. The value of the current element
   in the array.

3. The index of the current element
   in the array.

4. The array `reduce` is invoked on.

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 4, 5];

const calculateSum = (accumulator, currentValue) => accumulator + currentValue;

const sum = numbers.reduce(calculateSum);
console.log(sum);
</code>
</codeblock>

In the example given above,
the initial value of `reduce` is omitted.
By default `reduce` takes the value of
the first element of the array it is invoked on
as the **initial value**.
