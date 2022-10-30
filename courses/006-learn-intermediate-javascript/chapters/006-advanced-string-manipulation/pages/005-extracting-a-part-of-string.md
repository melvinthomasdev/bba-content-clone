The `slice()` method returns a part
of the string. We can determine which
part gets extracted by providing the
**start-index** and the **end-index**.
The character at the **end-index** is not
included.

<Editor lang="javascript">
<code>
let myString = "ThisIsALongString";
let result = myString.slice(0, 4);
console.log(result);
</code>
</Editor>

However, if we do not provide the **end-index**, the result will
contain the characters in the main string
from the **start-index** to the last character.

<Editor lang="javascript">
<code>
let myString = "ThisIsALongString";
let result = myString.slice(4);
console.log(result);
</code>
</Editor>