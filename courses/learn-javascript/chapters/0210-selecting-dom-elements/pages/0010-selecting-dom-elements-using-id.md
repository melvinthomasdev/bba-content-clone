In order to manipulate any DOM element,
we need to be able to select it first.

This is where **selectors** come in.

`getElementById` will select the HTML
element which matches the
provided `id` value.

In the example given below,
you can see that the text **Win!** is
now larger than the other text.
And
if you look at the console, you'll see
that `currentInspiration` refers to
the `p` element. The browser views it as
a DOM object with properties.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h2 class="heading">The most inspiring words</h2>
<p class="textual-details" id="win-inspiration">Win!</p>
<p class="textual-details" id="movie-reference">You are the one!</p>
<p class="textual-details" id="work-inspiration">Deadline!</p>
</panel>
<panel language="javascript">
let currentInspiration = document.getElementById('win-inspiration');

/*
  The code below this line will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/
currentInspiration.style.fontSize = '32px';
console.log(currentInspiration);
</panel>
</code>
</codeblock>