The variables `firstElement`
and `secondElement` stores
the first two array elements.

Store the default value,
`No fruit provided!`
in the variable `secondElement`.

<Editor type="exercise" lang="javascript">
<code>
let [firstElement, secondElement] = ["Apple"];

console.log(firstElement);
console.log(secondElement);
</code>

<solution>
let [firstElement, secondElement = "No fruit provided!"] = ["Apple"];

console.log(firstElement);
console.log(secondElement);
</solution>
</Editor>