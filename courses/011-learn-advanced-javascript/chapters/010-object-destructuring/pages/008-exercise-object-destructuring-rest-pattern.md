The object `fruit`
contains properties `fruitName`,
`taste` and `weight`.

Use the rest pattern
to store the second
and
the third property in the variable, **everythingElse**.
Store the first property
in the variable **fruitName**.

<Editor type="exercise" lang="javascript">
<code>
let fruit = {
  fruitName: "Apple",
  taste: "Sweet",
  weight: 100
}

console.log(everythingElse.weight);
</code>

<solution>
let fruit = {
  fruitName: "Apple",
  taste: "Sweet",
  weight: 100
}

let {fruitName, ...everythingElse} = fruit;
console.log(everythingElse.weight);
</solution>
</Editor>