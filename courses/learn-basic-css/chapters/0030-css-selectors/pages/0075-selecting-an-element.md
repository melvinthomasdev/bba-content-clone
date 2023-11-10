Regardless of the selector we use,
we are ultimately selecting the
same element.

Let's have a look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<img src="https://ucarecdn.com/fc228388-6c3c-4ee8-ad3e-591ae79d0fdb/">
<h2>CSS is easy!</h2>
<hr>
<p class="paragraph" id="para">CSS is a powerful and relatively straightforward language used for styling web pages. </p>
</panel>
<panel language="css">
* {
  text-align: center;
}

img {
  height: 100px;
  width: 80px;
}

p {
  font-size: 30px;
}

.paragraph {
  background-color: steelblue;
  padding: 10px;
}

#para {
  color: white;
}
</panel>
</code>
</codeblock>

In the above example, we tried
to style the paragraph in three
different ways.

We used the element selector `p`
and
changed the `font-size`.

We used the class selector `.paragraph`
to change the background colour.

Finally, we used the `#para` id selector
and
changed the colour of the text. 

As can be seen, we can select an element
using any type of a selector.
