We can change the appearance of links
not only like the normal elements, but
also depending on some user actions.
Like when the user takes their cursor
over the link, or just when the user
clicks the link or based on whether the
link was previously visited or not.
For this, we use the following link states:

**`a:visited`** - Applies if the link
was visited previously

**`a:hover`** - Applies when the user
takes the cursor over the link

**`a:active`** - Applies when the
link is just clicked

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  First, take the cursor on the link to see the hover styles take effect.
  Next click on it to see the active styles take effect.
  Notice that the visited styles take effect after you have clicked it once.
</p>
<a href="#">
  Hover and click
</a>
</panel>
<panel language="css">
a {
  color: tomato;
}
a:visited {
  color: darkgrey;
}
a:hover {
  color: orange;
  text-decoration: none;
}
a:active {
  color: darkred;
}
</panel>
</code>
</codeblock>

Here, `a:visited`, `a:hover` and `a:active` are called **Pseudo-class selectors**.

`a:active` must be specified after `a:hover` and `a:hover` must be specified after `a:visited` for the styles to take effect.
