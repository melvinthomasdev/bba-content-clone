JavaScript is **single-threaded**, which means
it can only complete one task at a time and
must finish the current task before moving
on to the next one.
It cannot perform two tasks **simultaneously**.

Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
console.log("Start");
console.log("Hello");
console.log("Hi");
console.log("End");
</code>
</codeblock>

In the above code, the four statements will be
printed to the console one after another.
If, for any reason, one of these operations
takes a long time, the JavaScript engine will
**wait** for it to finish before moving on to the next one.
