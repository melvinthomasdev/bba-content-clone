If the number of array elements
is more than the number of variables provided
in destructuring, the extra
elements are omitted.

In the example given below,
the array has **three** elements,
but we are using only two variables
to store the elements.
The third element is omitted
without giving an error.

<Editor lang="javascript">
<code>
let fruits = ["Apple", "Orange", "Mango"];

[first, second] = fruits;
console.log(first);
console.log(second);
</code>
</Editor>

If we do not want to omit any element, we can add a parameter at the end. This parameter should have three dots `...` as the prefix.
This variable stores all the extra elements in the array.

In the example given below,
the array has four elements. The third and the fourth elements are stored in the `...rest` variable.

<Editor lang="javascript">
<code>
let fruits = ["Apple", "Orange", "Mango", "Banana"];

[first, second, ...rest] = fruits;
console.log(rest);
</code>
</Editor>

You can use any other name
instead of `...rest`.

You can change the name to  `...fruitList`
or any other name of your choice.
It does not change the result.
This will create an array
of all the remaining values
in the array.