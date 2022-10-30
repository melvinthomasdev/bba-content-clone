Use the `map.delete()` method
to remove the pair, which has a key equal to `thirdName` from the `fruits` Map.

<Editor type="exercise" lang="javascript">
<code>
let fruits = new Map([
  ["firstName", "apple"],
  ["secondName", "banana"],
  ["thirdName", "mango"]
]);
// your code here;
console.log(fruits);
</code>

<solution>
let fruits = new Map([
  ["firstName", "apple"],
  ["secondName", "banana"],
  ["thirdName", "mango"]
]);
fruits.delete("thirdName");
console.log(fruits);
</solution>
</Editor>