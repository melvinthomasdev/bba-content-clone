Use an IIFE to immediately execute
the function given in the editor.

<Editor lang="javascript" type="exercise">
<code>
function(){
  let a = 12;
  let b = 34;
  console.log(a + b);
}
</code>

<solution>
(function(){
  let a = 12;
  let b = 34;
  console.log(a + b);
})();
</solution>
</Editor>