In the three code examples given below,
fix all the bad practices we have learnt so far.

Since we are testing here for good/bad coding practices which are subjective, some of these questions can have more than one right answer.

Please refer the comment attached with the solution to get more details on our approach.

**Code Example 1**

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
let totalNumberOfVoters = 19;
let numberOfVotesCast = 5;
numberOfVotesCast = 6
</code>
<solution>
/* 
The variable `totalNumberOfVoters` can be declared using `const` as it is updated anywhere in 3 lines given.
Declare a variable with `let` only if you need to update the value later, like for example, `numberOfPeople`.
*/
const totalNumberOfVoters = 19;
let numberOfPeople = 1;
numberOfPeople = 5
</solution>
</codeblock>

**Code Example 2**

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Area formula of a rectangle is length * breadth.
const A = 12
const b = 15
console.log(`Area of the rectangle is ${a*b}cm²`)
</code>
<solution>
// we do not commonly start variable names with capital letter except for specific situations like mathematical notation.
// example: const Pi = 3.14;
// we use semicolons after finishing statements such as variable declaration with let or const, it makes the code more readable.

const lengthInCm = 12;
const breadthInCm = 15;

console.log(`Area of the rectangle is ${lengthInCm * breadthInCm}cm²`);
</solution>
</codeblock>

**Code Example 3**

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Below we are assigning a student id to a variable
N = 1234;
console.log(N);
</code>

<solution>
// naming a variable should be done using either let or const. 
// variable names should tell us about the data it holds.
const studentId = 1234;
console.log(studentId);
</solution>
</codeblock>
