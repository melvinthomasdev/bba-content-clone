The object `fruit`
contains the property
`fruitName`.

Store the default value
of `150` in the variable
`weight`.

<Editor type="exercise" lang="javascript">
<code>
let fruit = {
  fruitName: "Apple",
}

console.log(weight);
</code>

<solution>
let fruit = {
  fruitName: "Apple",
}

let {fruitName, weight = 150} = fruit;
console.log(weight);
</solution>
</Editor>