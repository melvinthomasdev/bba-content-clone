As you read in the previous lesson that when `break` statement is not provided, the execution will continue to the next case's code block. We can take advantage of this feature to handle multiple cases together.

Let us look at an example below:

<codeblock language="javascript" type="lesson">
<code>

const passedRollNumbers = [ 8746, 5649, 3268, 7901 ];
const otherRollNumbers = [ 4387, 1752, 6210, 9834 ];
const rollNumberToCheck = 7901;

switch(rollNumberToCheck) {
  case 8746: case 5649: case 3268: case 7901:
    console.log("Congratulations, you have passed the test!");
    break;

  case 4387: case 1752: case 6210: case 9834:
    console.log("Unfortunately, you did not pass the test. Better luck next time!");
    break;

  default:
    console.log("Provided roll number is invalid");
};

</code>
</codeblock>

Here for the roll numbers `8746, 5649, 3268, 7901` the code to be executed is the same: `console.log("Congratulations, you have passed the test!"); `. So we group them together and write the code to be executed once. We do the same for the other set as well.

