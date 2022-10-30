We can use the destructuring assignment
to interchange the values
of two variables.

In the example given below,
we are creating a
temporary array to change the values.

<Editor lang="javascript">
<code>
let name = "Sam";
let number = 123;
[name, number] = [number, name];
console.log(`The name becomes ${name} and the number becomes ${number}`);
</code>
</Editor>