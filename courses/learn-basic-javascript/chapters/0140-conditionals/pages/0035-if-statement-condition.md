In the previous lesson we
learnt that an if statement
is a conditional statement in
programming that allows you
to execute a block of code
if the provided condition
evaluates to true.

While this is a correct
explanation of the if statement.
However, in itself this
explanation is not completely
accurate.

This is because what an if
statement expects for the
code block to execute is
just a **truthy** value.
It doesn't necessarily have
to be a logical operation.

It could be either of the 
**truthy** values that we
learnt in the previous
lessons.

Let's take a look at an example:

<codeblock language="javascript" type="lesson">
<code>
if(true) {
  console.log("This will print, as the condition is a truthy value.");
}
if(false) {
  console.log("This will not print, as the condition is not a truthy value.");
}
</code>
</codeblock>

In the above example we saw
that the if statement which
has the boolean value `true` 
(Truthy) executes the code,
meanwhile the if statement
with the boolean value `false` 
(Falsy) does not execute.

Let's take another example:
<codeblock language="javascript" type="lesson">
<code>
const employee = {
  name: "Sam"
}

if(employee.name) {
  console.log(`Name of the employee is ${employee.name}.`)
}
</code>
</codeblock>

In the above example, we
see that the condition
given to the if statement
is not a logical operation.
`employee.name` evaluates
to "Sam", which is not an
operation, but a String
We know that String in
javascript is a **truthy**
value.

This is the reason why the
code executes and we can
see the code-block inside
the if statement runs and
the console statement is
printed.
