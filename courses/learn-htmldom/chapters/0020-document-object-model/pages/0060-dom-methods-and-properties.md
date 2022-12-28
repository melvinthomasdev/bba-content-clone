A DOM tree is simply a
neatly organized structure
of **objects**.
It can be safely
assumed that all these objects would have
methods and properties that
we can use
and
change.

In the example given below, in the
HTML part, try changing the `p` tag to
the `div` tag
or any other tag
of your choice.
Look at the result
to see how we are
using a property
to get the name of
the HTML element.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p id="current-element"></p>
</panel>
<panel language="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

let currentElement = document.getElementById("current-element");
currentElement.innerText = `This is a ${currentElement.tagName} tag`;
</panel>
</code>
</codeblock>

Here, we have used
the `getElementById()` method
to get the required element.
We have used
the `tagName` property to
identify the type of
tag being used.

We have also used
the `innerText` property
to change the text
inside the element.

Here's a list of
some of the major
[DOM methods and properties](https://www.w3schools.com/jsref/dom_obj_all.asp)
that can be used
on all HTML elements.