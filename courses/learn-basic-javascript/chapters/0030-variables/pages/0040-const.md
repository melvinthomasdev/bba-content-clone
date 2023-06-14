In the previous chapters of this section,
we created variables using
the `const` keyword.
`const` is short for **"constant"**.
It is used to create a variable
whose value is not intended to
be changed at all,
once it is created.

If we try to change
the value of a variable
created using the `const` keyword,
we will get an error.

<codeblock language="javascript" type="lesson">
<code>
const speed = 40;
console.log(speed);


speed = 56; // This will cause an error when code is run
console.log(speed);
</code>
</codeblock>

The first line in the above example `const speed = 40;` can be split into two parts.
**declaration**
`const speed`
- This part where we create the variable is called declaration.
**initialization**
`= 40`;
- The second part of assigning the created (declared) variable an initial value is called initialization.

We will be writing `declaring a variable` instead of `creating a variable` from now on. 


We should also keep in mind that when declaring a variable using the `const` keyword, we must always assign it a value right away.

<codeblock language="javascript" type="lesson">
<code>
const speed = 40; // declaration and initialization done
console.log(speed);


const length; // This will cause an error as initialization is not done
console.log(length);
</code>
</codeblock>
