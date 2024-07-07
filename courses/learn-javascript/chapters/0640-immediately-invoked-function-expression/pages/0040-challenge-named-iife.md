Use an IIFE to immediately execute
the `displaySum` function.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
function displaySum(){
  const num1 = 12;
  const num2 = 34;
  console.log(num1 + num2);
}
</code>

<solution>
(function displaySum(){
  const num1 = 12;
  const num2 = 34;
  console.log(num1 + num2);
})();
</solution>
</codeblock>