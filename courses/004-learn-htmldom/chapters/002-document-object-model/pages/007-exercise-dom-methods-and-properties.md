In the example given below,
right now,
the text inside
the `h2` is **Lightpink**.
Try changing it to
the name of any
common colour of your choice,
like **blue**,
**green**,
or
**steelblue**.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<h2 id="title-text">Lightpink</h2>
</panel>
<panel lang="css">
h2 {
  font-family: Helvetica;
  font-size: 48px;
}
</panel>
<panel lang="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/
let titleText = document.getElementById("title-text");
titleText.style.color = titleText.innerText;
</panel>
</code>
</Editor>