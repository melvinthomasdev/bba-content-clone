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

![fruits array](https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/arraylesson_EYRb6cPza.png)

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

const result = `Second fruit is ${fruits[1]}`;
console.log(result);
</code>
</codeblock>
