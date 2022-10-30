Store the **first** array
element in the variable **apples**
and
the **third** element in
the variable **oranges**.

Use comma to ignore the **second** element.

<Editor type="exercise" lang="javascript">
<code>
let numbers = [1, 2, 3];

console.log(apples);
console.log(oranges);
</code>

<solution>
let numbers = [1, 2, 3];
let [apples, ,oranges] = numbers;
console.log(apples);
console.log(oranges);
</solution>
</Editor>