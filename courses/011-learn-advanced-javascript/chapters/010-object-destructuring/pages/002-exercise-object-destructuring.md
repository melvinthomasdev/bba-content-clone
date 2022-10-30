The object `fruit` contains
properties `fruitName`,
`taste` and `weight`.

Use object destructuring
to extract all the properties.
The output message should be:
`The Apple is Sweet and it weighs 100 grams.`

<Editor type="exercise" lang="javascript">
<code>
let fruit = {
  fruitName: "Apple",
  taste: "Sweet",
  weight: 100
}


console.log(`The ${fruitName} is ....`);
</code>

<solution>
let fruit = {
  fruitName: "Apple",
  taste: "Sweet",
  weight: 100
}

let {fruitName, taste, weight} = fruit;

console.log(`The ${fruitName} is ${taste} and it weighs ${weight} grams.`);
</solution>
</Editor>