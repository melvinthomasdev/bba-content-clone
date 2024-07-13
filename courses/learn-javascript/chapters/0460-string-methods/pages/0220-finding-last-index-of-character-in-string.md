The `lastIndexOf()` method helps us locate
the last instance of a substring
inside a string.

It accepts two arguments -
**substring**
and
**fromIndex**.
The method returns index of the
the first occurrence of the **substring**
by searching the main string from
it's last index to its first.
In other words,
the method returns the index of the
last occurrence of the **substring**.
The default value of **fromIndex** is
the last index of the string.

Let's take a look at an example
that passes only the **substring** argument.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";
const indexOfES = message.lastIndexOf("es");
console.log(indexOfES);
</code>
</codeblock>

In the example given above,
the last occurrence of **"es"**,
inside **"Sam loves mangoes."**
is at the index `15`
and
hence the output is `15`.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";
const indexOfES = message.lastIndexOf("es", 9);
console.log(indexOfES);
</code>
</codeblock>

In the example given above,
the method looks for the substring
from the index `9` and below.
In other words,
it looks for the substring
inside **"Sam loves "**.
In this case,
the last occurrence of **"es"**
is at the index `7`.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";
const indexOfXY = message.lastIndexOf("xy");
console.log(indexOfXY);
</code>
</codeblock>

If there are no matches,
the method would return `-1`.
In the above example,
there were no occurrences of **"xy"**
inside **"Sam loves mangoes."**
and so we go the output as `-1`.
