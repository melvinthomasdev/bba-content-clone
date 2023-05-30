Let us start by solving the challenge described below with what you have learned till now. Try not to scroll down or take a peek at the solution.

**Challenge:**

For a yearly Felicitation
ceremony, we have the data
of guests provided as an object
with only one property
**role: <different values>**.
In the above **key:value**
pair, the different value
the key can have are:
`faculty`, `volunteer`,
`student` and `visitor`.

Only faculty and volunteer
are allowed backstage.
Based on this information
write a code that
logs `Access granted` to
the console if the role of
the guest is either
`faculty` or `volunteer`.

In all other cases log
`Access denied`
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const guest = {
  role: "volunteer"
};
// Write code here.
</code>
<solution>
const guest = {
  role: "volunteer"
};

if (guest.role === "faculty" || "volunteer") {
  console.log(`Access granted`);
} else {
  console.log(`Access denied`);
}
</solution>
</codeblock>

There is a possibility that some of us would have solved the above problem in the below given manner:

```js
if (guest.role === "faculty") {
  console.log(`Access granted`);
} else if (guest.role === "volunteer") {
  console.log(`Access granted`);
} else { 
  console.log(`Access denied`); 
}
```

In the above snippet, we have two if conditions that logs the same output to the screen. We can improve this using the OR `||` operator.

Look at the code snippet below which
is taken from the solution that we have provided:

```js
if(guest.role === "faculty" || "volunteer") {
  console.log(`Access granted`);
} else {
  console.log(`Access denied`);
}
```

As you can see we have written the same code in much simpler terms by combining both `if` conditions using the `||` operator in a single `if` statement.

We can use the OR operator - `||`,
to confirm if at least one condition is
`true` before executing a block of code.

In the solution to the example
given above, the `if` statement
has two conditions -
`guest.role === "faculty"`
and `guest.role === "volunteer"`,
both giving the same output logging
to the console.

This means that the code block of the 
`if` statement will be executed if at least
one of the conditions are `true`.

If both of them are `false` the `else`
code block will get executed.

This behavior can be represented in a table
as shown below.

| guest.role === "faculty"        | guest.role === "volunteer" | Result |
| ------------------------------- | -------------------------- | ------ |
| true                            | true                       | true   |
| true                            | false                      | true   |
| false                           | true                       | true   |
| false                           | false                      | false  |


Another example provided is a code
that checks if a value is neither
`null` nor `undefined` using the
`||` operator.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "Japan"
};
const courseFee = 1000;

if (student.grade === null || student.grade === undefined) {
  console.log("Student grade must be provided");
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>

Since we do not have a `grade`
key in the `student` object
value of `student.grade`
will be undefined, and
therefore we get the output
"Student grade must be provided".

We would get the same output
if the value of the
`student.grade` variable was `null`.
