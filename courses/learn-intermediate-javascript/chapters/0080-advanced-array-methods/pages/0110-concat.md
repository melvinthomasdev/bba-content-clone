**Concatenate** means to join
two things in succession.

The `concat()` method creates
a new array that contains elements
from the array on which `concat`
is invoked followed by
the arguments passed.
If the argument is an array,
the elements of the array will
be inserted into the new array.

<codeblock language="javascript" type="lesson">
<code>
const evenNumbers = [2, 4, 6];
const oddNumbers = [1, 3, 5];
const numbers = evenNumbers.concat(oddNumbers);
console.log(numbers);
</code>
</codeblock>

In the example given above,
the array `numbers` contains
the elements of
the `evenNumbers` array
followed by the elements of
the `oddNumbers` array.

<codeblock language="javascript" type="lesson">
<code>
const evenNumbers = [2, 4, 6];
const oddNumbers = [1, 3, 5];

const arrayOfRandomElements1 = evenNumbers.concat(oddNumbers, 7, "Integers", true);
console.log(arrayOfRandomElements1);

const arrayOfRandomElements2 = evenNumbers.concat(7, "Oliver Smith", oddNumbers, false);
console.log(arrayOfRandomElements2);

const arrayOfRandomElements3 = evenNumbers.concat(7, "Separator", [oddNumbers], false);
console.log(arrayOfRandomElements3);
</code>
</codeblock>

In the example given above,

- `evenNumbers.concat(oddNumbers, 7, "Integers", true)`
  creates a new array
  that contains the elements of `evenNumbers`,
  followed by the elements of `oddNumbers`,
  followed by the elements
  `7`, `"Integers"`, and `true`.

- `evenNumbers.concat(7, "Oliver Smith", oddNumbers, false)`
  creates a new array
  that contains the elements of `evenNumbers`,
  followed by the elements `7` and `"Oliver Smith"`,
  followed by the elements of `oddNumbers`,
  followed by `false`.

- `evenNumbers.concat(7, "Separator", [oddNumbers], false)`
  creates a new array
  that contains the elements of `evenNumbers`,
  followed by the elements
  `7`, `"Separator"`, `[oddNumbers]`, and `false`.
