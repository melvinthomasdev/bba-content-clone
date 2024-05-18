Consider the function provided in the example below.

<codeblock language="javascript" type="lesson">
<code>
const printHighestScore = (name, score1, score2) => {
  const highestScore = Math.max(score1, score2);
  console.log(`${name}'s highest score is ${highestScore}`);
}

printHighestScore("Sam", 78, 90);
</code>
</codeblock>

In the example given above,
the function can only find the highest score from a specific number of scores.
In this case,
the function can only find the highest score from two scores.

Let's consider the following example,
where different function calls have different number of scores passed.

<codeblock language="javascript" type="lesson">
<code>
const printHighestScore = (name, score1, score2) => {
  const highestScore = Math.max(score1, score2);
  console.log(`${name}'s highest score is ${highestScore}`);
}

printHighestScore("Sam", 78, 90);
printHighestScore("Oliver", 72, 65, 98);
printHighestScore("Steve", 84, 69, 43, 97);
</code>
</codeblock>

In the above example,
no matter how many extra arguments are passed,
the function gets executed
and
it only takes the value of the parameters `name`, `score1`, and `score2`.

It is in such cases we need to use **rest parameters**.
The **rest parameters** method enables a function to have an unspecified number of arguments.
Let's modify the above example to use **rest parameters**.

<codeblock language="javascript" type="lesson">
<code>
const printHighestScore = (name, ...scores) => {
  const highestScore = Math.max(...scores);
  console.log(`${name}'s highest score is ${highestScore}`);
}

printHighestScore("Sam", 78, 90);
printHighestScore("Oliver", 72, 65, 98);
printHighestScore("Steve", 84, 69, 43, 97);
</code>
</codeblock>

In the above example,
the `printHighestScore` always accepts the first argument as `name`.
The rest of the arguments are grouped into an array `scores`.
So for the function call `printHighestScore("Oliver", 72, 65, 98)`,
the value of `scores` is `[72, 65, 98]`.

It is also important to note that the **rest parameters** can accept no parameters,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const printHighestScore = (name, ...scores) => {
  const highestScore = Math.max(...scores);
  console.log(`${name}'s highest score is ${highestScore}`);
}

printHighestScore("Sam");
</code>
</codeblock>

In the example given above,
the value of `scores` is `[]`.
That is why we get the value of `Math.max(...scores)` as `-Infinity`.

To prevent such unwanted edge cases,
let's put in a condition to exit the function
if the length of `scores` is `0`.

<codeblock language="javascript" type="lesson">
<code>
const printHighestScore = (name, ...scores) => {
  if (scores.length === 0) return;

  const highestScore = Math.max(...scores);
  console.log(`${name}'s highest score is ${highestScore}`);
}

printHighestScore("Sam");
</code>
</codeblock>

The `if` statement from the example above,
is called a **guard clause**.
It stops the execution of a function for certain a condition.

Do note that,
the **rest parameters** can only be used once in a function definition
and
should be used as the last parameter.
