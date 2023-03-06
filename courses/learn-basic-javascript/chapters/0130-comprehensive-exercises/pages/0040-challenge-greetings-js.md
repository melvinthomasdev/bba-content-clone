Create a function called greetings that accepts two arguments:
  - a string (message) and a function (callback).
  - it will return the result of the callback function called with the message as argument.

The callback function can be anything, console, alert, prompt or a custom function.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
// This is a template solution, the output will vary accordingly.
<!-- 
With system functions

const greetings = (message, callback){
  return callback(message);
};

console.log(greetings("Hello!", console.log));
console.log(greetings("Hi!", alert));
console.log(greetings("Good Morning!", prompt));

With custom function

const callback = (message) => `${message} How are you doing today?`;

const greetings = (message, callback) => {
  return callback(message);
};

console.log(greetings("Hello!", callback));
console.log(greetings("Hi!", callback));
console.log(greetings("Good Morning!", callback));
-->

// Here greetings is a higher order function, we will learn more about this in advanced concepts, feel free to look it up.
</solution>
</codeblock>
