The `lastIndexOf()` method helps us find the last instance
of a string inside another.

It accepts two arguments - a **substring** and a **position**.
The method looks for the **substring** starting from the end of the main string. It returns the position at which the string is found first, beginning from the end.

<Editor lang="javascript">
<code>
let myString = "Sam loves mangoes.";
let result = myString.lastIndexOf("es");
let resultWithPos = myString.lastIndexOf("es", 10);
console.log(result);
console.log(resultWithPos);
</code>
</Editor>

If there are no matches, it returns -1.