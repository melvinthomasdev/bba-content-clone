In JavaScript, you can define a function and pass it as an argument to another function.
Such a function, is called a **callback function**.

Let us have a look at an example:
<codeblock language="javascript" type="lesson">
<code>
const validateSolution = (solution, statusMessage) => {
  if (solution === 11) {
    statusMessage(true);
  } else {
    statusMessage(false);
  }
};

const statusMessage = (status) => {
  if (status) {
    console.log("Great! Your answer is correct!");
  } else {
    console.log("Oops! Your answer is incorrect. Please try again.");
  }
};
const solution = 11; 
validateSolution(solution, statusMessage);
</code>
</codeblock>

In the above code we see **2** functions `validateSolution` and  `statusMessage`.
`statusMessage` is passed as an argument to `validateSolution`, this makes `statusMessage` a callback function.

This example showcases the use of a callback function `statusMessage` to handle and display the success or error status based on the result of the validation process done in the `validateSolution` function.
