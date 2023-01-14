In JavaScript,
we can define a function
inside another function.
The inner function can access
the variables defined in
the outer function.

However, the outer function
does not have access
to the variables defined
in the inner function.

<codeblock language="javascript" type="lesson">
<code>
const outerFunc = () => {
  let outerNum = 1;

  const innerFunc = () => {
    console.log("Printing outerNum in innerFunc: " + outerNum);
    outerNum = 4;
  }
  innerFunc();

  console.log("Printing outerNum in outerFunc: " + outerNum);
}

outerFunc();
</code>
</codeblock>

In the example given above,

- We can access `outerNum` from inside both
  the `outerFunc` and the `innerFunc` functions.

- Changes made to `outerNum`
  from within the `innerFunc` function
  remains even outside the function.

<codeblock language="javascript" type="lesson">
<code>
const outerFunc = () => {

  const innerFunc = () => {
    const innerNum = 2;
    console.log("Printing innerNum in innerFunc: " + innerNum);
  }
  innerFunc();

  console.log("Printing innerNum in outerFunc: " + innerNum); // ReferenceError
}

outerFunc();
</code>
</codeblock>

In the example above,
we can access `innerNum` only from
inside the `innerFunc` function.
If we try to access it from `outerFunc`,
we will get an error.
