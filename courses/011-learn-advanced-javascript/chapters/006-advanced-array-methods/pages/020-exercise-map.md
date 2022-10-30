Use the `map()` method
to multiply each element
of the `oddNumbers` array
by 3 and store it
in the `triple` array.

<Editor lang="javascript" type="exercise">
<code>
let oddNumbers = [3, 5, 7];
let triple = ;
console.log(triple);
</code>

<solution>
let oddNumbers = [3, 5, 7];
let triple = oddNumbers.map( function(i) {
  return (i * 3);
});
console.log(triple);
</solution>
</Editor>