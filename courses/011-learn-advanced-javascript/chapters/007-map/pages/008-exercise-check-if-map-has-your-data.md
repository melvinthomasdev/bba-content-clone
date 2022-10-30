Use the `map.has()` method
to check whether the key `fruitName`
is present in the `fruits` Map.

<Editor type="exercise" lang="javascript">
<code>
let fruits = new Map([
  ["fruitName", "apple"]
]);
let result = ;
console.log(result);
</code>

<solution>
let fruits = new Map([
  ["fruitName", "apple"]
]);
let result = fruits.has("fruitName");
console.log(result);
</solution>
</Editor>