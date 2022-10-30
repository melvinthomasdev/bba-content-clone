Underline the paragraph text and remove the underline from the link:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  Underline this text.
</p>
<a href="#">
  Remove underline from this link
</a>
</panel>
<panel lang="css">

</panel>
</code>

<solution>
p {
  text-decoration: underline;
}
a {
  text-decoration: none;
}
</solution>
</Editor>