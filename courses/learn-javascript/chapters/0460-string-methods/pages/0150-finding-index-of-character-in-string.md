There are a couple of ways in which
we can find if a string contains
another string or **substring**.

The `indexOf()` method helps us
locate a substring inside a string.
The method accepts two arguments -
**substring**
and
**fromIndex**.
The default value of **fromIndex**
is `0`.

Let's take a look at an example,
where we pass only the **substring**.

<codeblock language="javascript" type="lesson">
<code>
let string = "0123456123";
let result = string.indexOf("3");
let resultWithPos = string.indexOf("3", 6);
console.log(result);
console.log(resultWithPos);

string = "I like to use my tools to build home equipment"
result = string.indexOf("to");
resultWithPos = string.indexOf("to", 18);
console.log(result);
console.log(resultWithPos);
</code>
</codeblock>

In the example given above,
the first occurrence of **"es"**,
inside **"Sam loves mangoes."**
is at the index `7`
and
hence the output is `7`.

Now let's take a look at an example,
where we pass both the **substring**
and
**fromIndex** arguments.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";
const indexOfES = message.indexOf("es", 9);
console.log(indexOfES);
</code>
</codeblock>

In the example given above,
the method looks for the substring
from the index `9`.
In other words,
it looks for the substring
inside **" mangoes."**
In this case,
the first occurrence of **"es"**
is at the index `15`.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";
const indexOfXY = message.indexOf("xy");
console.log(indexOfXY);
</code>
</codeblock>

If there are no matches,
the method would return `-1`.
In the above example,
there were no occurrences of **"xy"**
inside **"Sam loves mangoes."**
and so we go the output as `-1`.
