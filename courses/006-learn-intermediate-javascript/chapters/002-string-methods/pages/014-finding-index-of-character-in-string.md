There are a couple of ways in which
we can find if a string contains
another string.

The `indexOf()` method helps
us locate a string inside another.

<Editor lang="javascript">
<code>
let myString = "Sam loves mangoes.";
let result = myString.indexOf("es");
let resultWithPos = myString.indexOf("es", 8);
console.log(result);
console.log(resultWithPos);
</code>
</Editor>

The method accepts two arguments -
a **substring**
and
the **position**.
The method looks for the **substring**
starting from the **position**
inside the main string.
It returns the position
at which the string gets matched first.

In the example given above,
we try to locate the index of
the string `es` inside
the string `Sam loves mangoes.`.
Once without a starting index,
and
once with a starting index.

If there are no matches,
the method would return -1.
