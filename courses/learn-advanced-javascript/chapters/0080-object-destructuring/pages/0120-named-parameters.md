Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const displayProfile = (name, age, totalMarks, attendancePercentage) => {
  console.log(`${name} age ${age} scored ${totalMarks} with an attendance percentage of ${attendancePercentage}%.`);
}

displayProfile("Sam Smith", 23, 89, 97);

displayProfile("Oliver Smith", 23, 47, 30);
</code>
</codeblock>

In the example given above,
the function `displayProfile`
has 4 parameters,
3 of which are numbers.
The function calls to `displayProfile`
contains 1 string argument
followed by 3 number arguments.
This is prone to confuse people
because they might
pass the arguments in the wrong order,
which will lead to the wrong output.

The parameters of `displayProfile`
in the example given above,
are called **positional parameters**
because while passing arguments
to these parameters,
the position in which each argument
is passed is important.
Changing the position
can lead to unwanted outputs.

In the example given above,
since all the arguments are related,
we can group them into
a single object `student`,
as shown in the example below:

<codeblock language="javascript" type="lesson">
<code>
const displayProfile = student => {
  console.log(`${student.name} age ${student.age} scored ${student.totalMarks} with an attendance percentage of ${student.attendancePercentage}%.`);
}

const student = {
  name: "Sam Smith",
  age: 23,
  totalMarks: 89,
  attendancePercentage: 97,
};
displayProfile(student);
</code>
</codeblock>

In the example given above,
there won't be any confusion
in the order in which
the arguments need to be passed,
since we are passing the arguments
as properties of an object
and
in an object,
the order of the properties does not matter.

In the example given above,
the function `displayProfile`
only has one parameter,
which is an object - `student`.
However, we do not use the object `student`
as a whole within the function.
We only use each property individually.
In that case it will be better
to destructure the `student` parameter,
as shown below:

<codeblock language="javascript" type="lesson">
<code>
const displayProfile = ({ name, age, totalMarks, attendancePercentage }) => {
  console.log(`${name} age ${age} scored ${totalMarks} with an attendance percentage of ${attendancePercentage}%.`);
}

const student = {
  name: "Sam Smith",
  age: 23,
  totalMarks: 89,
  attendancePercentage: 97,
};
displayProfile(student);
</code>
</codeblock>

In the example given above,
we can treat the keys
of the object parameter of `displayProfile`
as the parameters of the function.

The parameters of `displayProfile`
in the example given above,
are called **named parameters**
because each parameter
has a name associated with it,
i.e., the key name.

We can also define named default parameters,
as shown in the example below:

<codeblock language="javascript" type="lesson">
<code>
const placePizzaOrder = ({ name, size = "regular", extraCheese = false }) =>
  console.log(`Your order for a ${size}-sized ${name} Pizza${extraCheese ? " with extra cheese" : ""} has been placed.`);

placePizzaOrder({ name: "Pepperoni" });
placePizzaOrder({ name: "Margherita", extraCheese: true });
</code>
</codeblock>

In the example given above,
the parameters `size` and `extraCheese`
have default values.

If the `placePizzaOrder`
in the example given above,
used positional parameters,
the call `placePizzaOrder({ name: "Margherita", extraCheese: true })`,
would have to include all three parameters.

<codeblock language="javascript" type="lesson">
<code>
const placePizzaOrder = (name, size = "regular", extraCheese = false) =>
  console.log(`Your order for a ${size}-sized ${name} Pizza${extraCheese ? " with extra cheese" : ""} has been placed.`);

placePizzaOrder("Margherita", "regular", true);
placePizzaOrder("Margherita", true); // This will show wrong output
</code>
</codeblock>

In the example given above:

In `placePizzaOrder("Margherita", "regular", true)`
even though the second argument
is the same as the default value
for that parameter,
we cannot skip that argument.
This is because,
we cannot pass
the argument to the third parameter,
without passing the argument
to the second parameter.

In `placePizzaOrder("Margherita", true)`,
the intention was to:

- Pass `"Margherita"` to `name`.

- Use the default value for `size`.

- Pass `true` to `extraCheese`.

However, the argument `true`
was passed to `size`
and
the default value for `extraCheese` was used.
The ability to skip certain default parameters,
irrespective of their position,
is another reason why named parameters
are preferred over positional parameters.

**It is a best practice to
use named parameters when a function
has more than two parameters.**
