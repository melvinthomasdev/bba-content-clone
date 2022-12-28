Along with `:hover`, we can change
the appearance of links depending
on other user actions. We can change
the link styling for when
the user clicks the link or based
on whether the link was previously
visited or not:

`:visited` - Used if the link
was previously visited

`:active` - Applied when the
link is just clicked

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  First, take the cursor on the link to see the hover styles take effect.
  Next click on it to see the active styles take effect.
  Notice that the visited styles take effect after you have clicked it once.
</p>
<a href="#1">
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