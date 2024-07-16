When the selectors are identical,
or have the same importance,
the rule that comes later wins.
But what happens with different
selectors like in the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="p1" class="para">
  CSS is Cascading Style Sheets, and the cascading is important.
</p>
</panel>
<panel language="css">
#p1 {
  color: purple;
}
.para {
  color: red;
}
</panel>
</code>
</codeblock>

Though the rule `color: red`
appears later in the code,
the rule `color: purple` is used.

This is because, an **ID selector**
is more *specific* than a
**class selector**. The rule
from a more specific selector
is used. Here `#p1` is
said to have a higher **Specificity**.

Let's look at another similar example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="p1" class="para">
  CSS is Cascading Style Sheets, and the cascading is important.
</p>
</panel>
<panel language="css">
.para {
  color: red;
}
p {
  color: blue;
}
</panel>
</code>
</codeblock>

A **class selector** has a
higher specificity than an
**element selector**, which is
why the `color: red` is applied. The
rule with higher specificity will
get applied.
