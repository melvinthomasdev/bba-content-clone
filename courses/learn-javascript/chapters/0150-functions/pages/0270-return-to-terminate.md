After the return statement
in a function is executed,
further execution of
the function is terminated.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const calculateSum = (number1, number2) => {
  console.log("Calculating...");

  return number1 +  number2;

  console.log("Calculation complete");
}

const sum = calculateSum(23, 45);
console.log(sum);
</code>
</codeblock>

In the example given above:

- When the `calculateSum` function is invoked,
  first we get the output `"Calculating..."`.

- Then the sum `number1 +  number2` is returned.

- After the return statement,
  the function execution is stopped.
  The statement `console.log("Calculation complete")`
  is not executed
  and
  hence we don't see it in the output.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const student1 = {
  name: "Sam Smith",
  nationality: "India",
};

const student2 = {
  name: "Oliver Smith",
  nationality: "USA",
};

const courseFee = 5000;

const getStudentFee = student => {
  if (student.nationality !== "India") {
    return courseFee;
  } else {
    const discountedFee = courseFee - courseFee * 0.1;
    return discountedFee;
  }
};

console.log(getStudentFee(student1));

console.log(getStudentFee(student2));
</code>
</codeblock>

In the example given above,
in the function `getStudentFee`:

- If the value of the `nationality`
  property of the parameter `student`
  is not `"India"`,
  the value of `courseFee` is returned.

- If the value of `student.nationality` is `"India"`,
  a 10% discounted course fee is calculated,
  stored in `discountedFee`,
  and
  the value of `discountedFee` is returned.

We can rewrite the `getStudentFee` function
in the example given above,
to make use of the fact that
the return statement terminates
further execution of a function.

<codeblock language="javascript" type="lesson">
<code>
const student1 = {
  name: "Sam Smith",
  nationality: "India",
};

const student2 = {
  name: "Oliver Smith",
  nationality: "USA",
};

const courseFee = 5000;

const getStudentFee = student => {
  if (student.nationality !== "India")
    return courseFee;

  const discountedFee = courseFee - courseFee * 0.1;
  return discountedFee;
};

console.log(getStudentFee(student1));

console.log(getStudentFee(student2));
</code>
</codeblock>

In the example given above,
in the function `getStudentFee`:

- If the value of `student.nationality`
  is not `"India"`,
  we return the value of `courseFee`.
  Since further execution
  of the function is stopped,
  we do not need to provide the else statement.

- If the value of `student.nationality` is `"India"`,
  `return courseFee;` will not be executed
  and
  we move to the next statement.
  A 10% discounted course fee is calculated,
  stored in `discountedFee`,
  and
  the value of `discountedFee` is returned.

So far, we have mainly used
the return statement to
return a value from a function.
The return statement can also be used
to purely stop further execution of a function.

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  name: "Sam Smith",
  isAdmin: true,
};

const user2 = {
  isAdmin: false,
};

const displayGreeting = user => {
  if (!user.name) return;

  console.log(`Hello ${user.name}`);
};

displayGreeting(user1);

displayGreeting(user2);
</code>
</codeblock>

In the example given above,
in the `displayGreeting` function:

- If the value of `user.name` is falsy,
  the `return;` statement is executed.
  This returns `undefined`
  and
  stops further execution of the function.

- If the value of `user.name` is truthy,
  the `return;` statement is not executed
  and
  we get an output from the `console.log` statement.

In the example given above,
the return statement
does not return any value.
It's purpose is purely for
terminating further execution
of the function.

In the example given above,
the if statement -
`if (!user.name) return;`
is known as a guard clause.
A guard clause prevents
further execution of a function,
for a certain condition.
