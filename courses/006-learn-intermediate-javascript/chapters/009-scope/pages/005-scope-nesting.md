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

In the example given below,
we have declared the variable `outerNum`
inside `outerFunc` function.
There's another function `innerFunc`
declared inside `outerFunc`.
The inner function has 
a variable `innerNum` declared inside it.

<Editor lang="javascript">
<code>
function outerFunc () {
  let outerNum = 1;

  function innerFunc () {
    let innerNum = 2;
    console.log("Printing outerNum in innerFunc: " + outerNum);
  }
  innerFunc();

  console.log("Printing outerNum in outerFunc: " + outerNum);
}

outerFunc();
</code>
</Editor>

We can access `outerNum` from both
the `outerFunc` and the `innerFunc` function.
But, we can access the `innerNum` only from 
inside the `innerFunc` function.
If we try to access it from `outerFunc`, we get an error.

<Editor lang="javascript">
<code>
function outerFunc () {
  let outerNum = 1;

  function innerFunc () {
    let innerNum = 2;
    console.log("Printing innerNum in innerFunc: " + innerNum);
  }
  innerFunc();

  console.log("Printing innerNum in outerFunc: " + innerNum); // ReferenceError
}

outerFunc();
</code>
</Editor>