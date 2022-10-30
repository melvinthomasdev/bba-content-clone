Use the `Object.entries()` method to
convert the `marksObject` to a `Map`.

<Editor type="exercise" lang="javascript">
<code>
let marksObject = {
  physics: 22,
  chemistry: 44,
  mathematics: 33
}

let marksMap = ;

console.log(marksMap);
</code>

<solution>
let marksObject = {
  physics: 22,
  chemistry: 44,
  mathematics: 33
}

let marksMap = new Map(Object.entries(marksObject));

console.log(marksMap);
</solution>
</Editor>