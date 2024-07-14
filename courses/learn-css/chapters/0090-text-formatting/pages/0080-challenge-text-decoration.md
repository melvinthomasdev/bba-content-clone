Underline the paragraph text and remove the underline from the link:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>
  Underline this text.
</p>
<a href="#">
  Remove underline from this link
</a>
</panel>
<panel language="css">

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
</codeblock>