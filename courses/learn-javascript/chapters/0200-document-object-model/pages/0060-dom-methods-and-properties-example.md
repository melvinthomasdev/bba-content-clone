In the example given below,
right now,
the text inside
the `h2` is **Lightpink**.
Change the text to
the name of any
common colour of your choice,
like **blue**,
**green**,
or
**steelblue**. 

<codeblock language="javascript" type="lesson" testMode="fixedInput">
<code>
<panel language="html">
<h2 id="title-text">Lightpink</h2>
</panel>
<panel language="css">
h2 {
  font-family: Helvetica;
  font-size: 48px;
}
</panel>
<panel language="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

const titleText = document.getElementById("title-text");

titleText.style.color = titleText.innerText;
</panel>
</code>
</codeblock>

When you change the text 
in the heading, notice that 
the colour of the heading text 
changes too. Even though you 
only changed the text in HTML, 
still somehow the text colour 
changed. This isn't done 
using HTML or CSS. 
This is JavaScript!
