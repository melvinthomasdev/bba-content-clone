Use an IIFE to immediately execute
the function given in the editor.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
() => {
  const num1 = 12;
  const num2 = 34;
  console.log(num1 + num2);
}
</code>

<solution>
(() => {
  const num1 = 12;
  const num2 = 34;
  console.log(num1 + num2);
})();
</solution>
</codeblock>
