We can use the spread operator
to copy an array or an object.

<Editor lang="javascript">
<code>
let array1 = [1, 2, 3];
let array2 = [...array1];

console.log(array2);
</code>
</Editor>

In the example given above,
we are using the spread operator
to copy `array1` into `array2`.

<Editor lang="javascript">
<code>
let object1 = {
  key1: "value1",
  key2: "value2"
}
let object2 = {...object1 };

console.log(object2);
</code>
</Editor>

In the example given above,
we are using the spread operator
to copy `object1` into `object2`.
