Use the `delete()`
method to remove **mango**
from the **fruits** Set.

<Editor type="exercise" lang="javascript">
<code>
let fruits = new Set(["apple", "banana", "orange", "mango"]);

let isMangoDeleted = ;

console.log(isMangoDeleted);
console.log("Updated fruits Set: ", fruits);
</code>

<solution>
let fruits = new Set(["apple", "banana", "orange", "mango"]);

let isMangoDeleted = fruits.delete("mango");

console.log(isMangoDeleted);
console.log("Updated fruits Set: ", fruits);
</solution>
</Editor>