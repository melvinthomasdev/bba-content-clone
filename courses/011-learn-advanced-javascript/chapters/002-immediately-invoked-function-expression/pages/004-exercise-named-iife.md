Use an IIFE to immediately execute
the `calculate` function.

<Editor lang="javascript" type="exercise">
<code>
function calculate(){
  let a = 12;
  let b = 34;
  console.log(a + b);
}
</code>

<solution>
(function calculate(){
  let a = 12;
  let b = 34;
  console.log(a + b);
})();
</solution>
</Editor>