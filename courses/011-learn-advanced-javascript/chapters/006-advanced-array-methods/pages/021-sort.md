The `sort()` method
sorts an array.
By default,
the method sorts
the array in the ascending order.

The sorting happens according
to the order in which the string versions
of the array elements
will appear in a dictionary.

<Editor lang="javascript">
<code>
let numbers = [3, 1, 4, 2];
numbers.sort();
console.log(numbers);
</code>
</Editor>

As you can see,
because the `sort` method
looks at the array elements as strings,
**11** comes before **2** in
the code given below.

<Editor lang="javascript">
<code>
let numbers = [3, 1, 4, 2, 11];
numbers.sort();
console.log(numbers);
</code>
</Editor>

We can supply a function as an
argument to the `sort()` method.
We can even change the sort order
from ascending to descending.

<Editor lang="javascript">
<code>
let numbers = [3, 1, 4, 2, 11];
function sortNumbers(a, b) {
  if(a > b) {
    return 1;
  }
  if(a == b) {
    return 0;
  }
  if(a < b) {
    return -1;
  }
}
numbers.sort(sortNumbers);
console.log(numbers);
</code>
</Editor>

In the example given above,
the `sortNumbers` function compares
two elements of the array
in the specified manner.
