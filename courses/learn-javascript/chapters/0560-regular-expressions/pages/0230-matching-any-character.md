When we want to match numbers or alphabets,
we use `\w`.

It can identify uppercase
and
lowercase characters.
It also matches underscores.

<codeblock language="javascript" type="lesson">
<code>
const regex = /\w/;
const character = "R";
console.log(regex.test(character));

const digit = 0;
console.log(regex.test(digit));
</code>
</codeblock>

In the above example, we use `\w` 
to match the character "R" and 
the digit 0.

<codeblock language="javascript" type="lesson">
<code>
const regex = /\w/;
const message = "hello";
const location = "Paris";
const id = "123";
console.log(regex.test(message));
console.log(regex.test(location));
console.log(regex.test(id));
</code>
</codeblock>

In the above example, `\w` matches 
a single alphabet or number from the 
different values. For example, it 
checks the first character in "hello". 
The first character is "h" which is a 
match. Similarly, it finds a match with the 
first value in all other variables.
