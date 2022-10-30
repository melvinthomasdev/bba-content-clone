The object `fruit`
contains the properties
`fruitName`, `taste` and `weight`.

Use a colon `:` to
copy the `taste`
property into the
variable `isSweet`.

The output should be:
`The apple is Sweet.`.

<Editor type="exercise" lang="javascript">
<code>
let fruit = {
  fruitName: "Apple",
  taste: "Sweet",
  weight: 100
}

let {taste} = fruit;
console.log();
</code>

<solution>
let fruit = {
  fruitName: "Apple",
  taste: "Sweet",
  weight: 100
}

let {taste: isSweet} = fruit;
console.log(`The apple is ${isSweet}.`);
</solution>
</Editor>