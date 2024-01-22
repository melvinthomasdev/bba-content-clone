Create a function `greetings`
that accepts two parameters
a string `message` and a
function `callback`.

The `callback` should always be
`console.log`. If the function
is not `console.log` then log
to the console: 
"Provide correct callback."

Else, `greetings` should call
`callback` function with
the `message` as argument.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here.
</code>
<solution>
const greetings = (message, callback) => {
  if (callback == console.log){
    return callback(message);
  } else {
    console.log("Provide correct callback.")
  }
};
</solution>
<testcases>
<caller>
greetings(testMessage, testCallback)
</caller>
<testcase>
<i>
const testMessage = "Hello!"
const testCallback = prompt
</i>
</testcase>
<testcase>
<i>
const testMessage = "Hi!"
const testCallback = console.log
</i>
</testcase>
<testcase>
<i>
const testMessage = "Good Morning!"
const testCallback = alert
</i>
</testcase>
<testcase>
<i>
const testMessage = "Goodbye!"
const testCallback = console.log
</i>
</testcase>
</testcases>
</codeblock>
