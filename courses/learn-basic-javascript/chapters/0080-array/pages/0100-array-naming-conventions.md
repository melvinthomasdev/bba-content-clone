The name of the variable to which
an array is assigned
should give a clear description of
what the array holds.

For example,
an array that contains a list of fruits
should not be given names such as
`list`, `array`, or any other name
that does not describe the content of the array.
Names such as `fruits` or `fruitNames`
should be used since they give a clear idea
of what the array will contain.

It is also important to note that
names like `fruitsList` or `fruitsArray`
should be avoided.
The name `fruits` itself gives the idea that
the value is an array of fruits.
Suffixing `fruits` with
`List` or `Array` is redundant.

<codeblock language="javascript" type="lesson">
<code>
// This is a bad name
const list = ["Apple", "Banana", "Orange"];
console.log(list);

// This is a good name
const fruits = ["Grapes", "Mango", "Watermelon"];
console.log(fruits);
</code>
</codeblock>

The name of the array should reflect
all the elements of that array.
It is not good to have an array named `fruits`
and
then have elements that are not fruits,
like, `"Salt"`, `12345`, and so on.

For an array that contains
names of fruits and vegetables,
a good name would be
`fruitsAndVegetables`, `ingredients`
or
`eatables`.
These names are descriptive of both the
fruits and vegetables elements.

<codeblock language="javascript" type="lesson">
<code>
// This is a bad name
const vegetables = ["Apple", "Potato", "Orange"];
console.log(vegetables);

// This is a good name
const fruitsAndVegetables = ["Carrot", "Mango", "Watermelon"];
console.log(fruitsAndVegetables);
</code>
</codeblock>

It is also important to note that
the usage of a plural variable name
implies that the value of the variable
will be an array.
Names such as `fruits`, `names`, and `users`,
all indicate that their values are arrays.
So we should name variables
that store arrays with a plural word.

On the other hand,
naming a variable that
does not store an array
with a plural word,
is misleading
and
should be avoided.

<codeblock language="javascript" type="lesson">
<code>
// This is a good name. "fruits" is plural and descriptive
const fruits = ["Apple", "Banana", "Orange"];
console.log(fruits);

// This is not a good name. bird is not a plural word
const bird = ["Crow", "Owl", "Pigeon"];
console.log(bird);

// This is a bad name.
// "sentences" is a plural word but the value is not an array
const sentences = "This variable contains only a string and hence should not have a plural name. A better name would be paragraph or message.";
console.log(sentences);
</code>
</codeblock>
