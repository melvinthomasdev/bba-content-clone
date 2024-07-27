We can use anonymous functions in 
situations where we don't want to 
reuse the functionality.

Take a look at the use of 
an anonymous function as a 
callback function:

<codeblock language="javascript" type="lesson">
<code>
const calculateFinalResult = (firstNumber, secondNumber, manipulateNumbers) => {
  return manipulateNumbers(firstNumber, secondNumber);
}

const sum = calculateFinalResult(2, 4, (val1, val2) => val1 + val2);
console.log(sum);

const product = calculateFinalResult(2, 4, (val1, val2) => val1 * val2);
console.log(product);

const remainder = calculateFinalResult(2, 4, (val1, val2) => val1 % val2);
console.log(remainder);
</code>
</codeblock>

We can definitely rewrite the above 
code and use a named function 
instead of an anonymous function. 
You'll get to see the use of 
anonymous functions more 
when you study topics like higher order 
functions, and Asynchronous JavaScript.
