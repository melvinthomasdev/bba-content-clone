We have two variables, `number` and `message`. 

We also have an `if` statement which checks if the value of `number` is greater than 3. If the condition is `true`, it stores `number is greater than 3` in the `message` variable.

Add an `else` statement, which stores `number is smaller than 3` in the `message` variable.

<Editor type="exercise" lang="javascript">
<code>
let number = 2;
let message;

if (number > 3) {
  message = "number is greater than 3";
} else {
  
}

console.log(message);
</code>

<solution>
let number = 2;
let message;

if (number > 3) {
  message = "number is greater than 3";
} else {
  message = "number is smaller than 3";
}

console.log(message);
</solution>
</Editor>