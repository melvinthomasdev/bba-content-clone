The code given below
displays **"Hello, World!"**
in the console.
Enclose the `console.log` statement
in a **do...while loop**,
such that it displays **"Hello, World!"**
`3` times.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
console.log("Hello, World!");
</code>

<solution>
let iteration = 0;
do {
  console.log("Hello, World!");
  iteration++;
} while (iteration < 3);
</solution>
</codeblock>