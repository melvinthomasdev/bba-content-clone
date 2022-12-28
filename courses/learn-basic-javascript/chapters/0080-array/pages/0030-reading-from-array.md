Each element of an array
has a number associated with it
starting from `0` and is
known as the **index** of that element.
It is used to indicate
the position of an element
within the array.
That is why we say
an array is **indexed**.

We can access an element by
specifying its index
in square brackets.

<codeblock language="javascript" type="lesson">
<code>
const names = ["Oliver", "Adam", "Eve"];

console.log(names[0]);
console.log(names[1]);
console.log(names[2]);
</code>
</codeblock>

Since indexing starts from 0,
it's important to note that,
when we say the **second** element
of an array, it is the element
at the index `1`.

<codeblock language="javascript" type="lesson">
<code>
const names = ["Oliver", "Adam", "Eve"];

console.log(`Second name is ${names[1]}`);
</code>
</codeblock>