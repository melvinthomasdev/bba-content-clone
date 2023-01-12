The property `list-style-image` can
be used to display an image in
place of the list item marker:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>
    Most spoken languages of the world
  </h3>
  <ul>
    <li>English</li>
    <li>Mandarin Chinese</li>
    <li>Hindi</li>
    <li>Spanish</li>
  </ul>
</panel>
<panel language="css">
ul {
  list-style-image: url('blue-marker.png');
}
</panel>
</code>
</codeblock>

The `url` will point to the location
of the image file. The image of the blue
circular list marker
is present in the same folder
where we have stored our css file
and
hence the relative path is simply
`url('blue-marker.png')`.