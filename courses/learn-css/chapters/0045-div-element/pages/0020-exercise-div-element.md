Let's use the `div` element to group similar parts of the HTML in the code below.

- Separate the code using two different `div` elements.
- Add ID selectors **dog** and **cat** to the `div` elements.
- Apply background colors **orange** and **yellow** to them respectively.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>Dog</h1>
<p>Dogs bark happily.</p>

<h1>Cat</h1>
<p>Cats purr softly.</p>
</panel>
<panel language="css">
/* Write your CSS here */
</panel>
</code>

<solution>
<panel language="html">
<div id="dog">
  <h1>Dog</h1>
  <p>Dogs bark happily.</p>
</div>

<div id="cat">
  <h1>Cat</h1>
  <p>Cats purr softly.</p>
</div>
</panel>
<panel language="css">
#dog {
  background-color: orange;
}
#cat {
  background-color: yellow;
}
</panel>
</solution>
</codeblock>
