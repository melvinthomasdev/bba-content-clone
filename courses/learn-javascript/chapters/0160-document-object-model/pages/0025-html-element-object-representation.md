Every HTML element
is viewed as an object
by the Browser.

In the example given below,
focus on the output
in the console
and
look at the number of properties
that the browser attaches
to the object:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>This is a diversion.</p>
</panel>
<panel language="javascript">
/*
  The following code will make sense as we study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

// Selects the first `p` tag and assigns it to the variable `paragraph`.
const paragraph = document.getElementsByTagName('p');

console.log(paragraph);
</panel>
</code>
</codeblock>

We will not be dealing with
these number of properties,
so don't worry about them.

Just understand that this
is how the browser views
an HTML element.
