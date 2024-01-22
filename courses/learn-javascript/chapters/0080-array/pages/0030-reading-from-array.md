Each element of an array
has a number associated with it
starting from `0` and is
known as the **index** of that element.
It is used to indicate
the position of an element
within the array.
That is why we say
an array is **indexed**.

The image below conveys how the
array indexes are associated.

![fruits array](https://ucarecdn.com/94143b5c-0919-4ad6-8f37-0ece2c2e7692/)

We can access an element by
specifying its index
in square brackets.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Banana", "Mango", "Cherry"];

console.log(fruits[0]);
console.log(fruits[1]);
console.log(fruits[2]);
console.log(fruits[3]);
console.log(fruits[4]);
</code>
</codeblock>

Since indexing starts from 0,
it's important to note that,
when we say the **second** element
of an array, it is the element
at the index `1`.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Banana", "Mango", "Cherry"];

console.log(`Second fruit is ${fruits[1]}`);
</code>
</codeblock>
