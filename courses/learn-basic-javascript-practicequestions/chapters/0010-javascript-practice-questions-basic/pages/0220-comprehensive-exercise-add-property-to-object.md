Follow the steps given below
to write a program:

1. Create an empty object `fruit`.
   An empty object is an object
   that has no properties.

2. Add the following properties to the object:

   | Key       | Value    |
   | --------- | -------- |
   | fruitName | "Banana" |
   | isSweet   | true     |
   | price     | 3        |

3. Then use `console.log()` to show the `fruit` object.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const fruit = {}

fruit.fruitName= "Banana";
fruit.isSweet= true;
fruit.price= 3;

console.log(fruit);
</solution>
</codeblock>

**Note** - Creating a new object
from scratch using the dot notation,
as done in this exercise,
is not the best practice.
We had already discussed about
how to create an object
along with its properties
in one go in previous chapters
(**7.1 - Create object** and
**7.2 - Object with multiple properties**).
We will be following that pattern
in future chapters.
In this exercise, our aim was
to give you more practice
using the dot notation.
