Just like any other style,
we can change the text size too,
based on screen width using media queries:

<Editor lang="css">
<code>
<panel lang="html">
<h1>Large heading on desktop</h1>
<h2>Relatively smaller one</h2>
</panel>
<panel lang="css">
h1 {
  font-size: 2rem;
}
h2 {
  font-size: 1.5rem;
}
@media screen and (min-width: 767px) {
  h1 {
    font-size: 2.6rem;
  }
  h2 {
    font-size: 2rem;
  }
}
</panel>
</code>
</Editor>

Resize the output panel to
see the headings made large
for larger screen sizes. It is
a good practice to resize
text based on the device size.