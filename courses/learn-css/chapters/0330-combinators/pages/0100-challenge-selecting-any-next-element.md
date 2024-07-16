Set `color` as `purple`
for all the `p` elements
that follow an
element with **quote** class:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Dale Cargnegie</h2>
<p>
  Dale Harbison Carnegie was an American writer, lecturer and the developer of famous courses in self-improvement, salesmanship, corporate training, public speaking and interpersonal skills.
</p>
<div class="quote">
  <strong>Famous Quotes:</strong>
</div>
<p>
  <em>
    "People rarely succeed unless they have fun in what they are doing"
  </em>
</p>
<p>
  <em>
    "Take a chance! All life is a chance. The man who goes farthest is generally the one who is willing to do and dare"
  </em>
</p>
</panel>
<panel language="css">

</panel>
</code>

<solution>
.quote ~ p {
  color: purple;
}
</solution>
</codeblock>