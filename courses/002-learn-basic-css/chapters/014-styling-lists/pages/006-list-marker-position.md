The `list-style-position` property is
used to specify whether the list
marker is placed within the
list text or outside the list text:

<Editor lang="css">
<code>
<panel lang="html">
<h3>
    Inner planets of the Solar system:
  </h3>
  <ul id="inner">
    <li>Mercury is the smallest planet in the Solar System and the closest to the Sun.</li>
    <li>Venus is the second planet from the Sun.</li>
    <li>Earth is the third planet from the Sun and the only astronomical object known to harbor life.</li>
    <li>Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System.</li>
  </ul>

  <h3>
    Outer planets of the Solar system:
  </h3>
  <ul id="outer">
    <li>Jupiter is the fifth planet from the Sun and the largest in the Solar System.</li>
    <li>Saturn is the sixth planet from the Sun.</li>
    <li>Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus.</li>
    <li>Neptune is the eighth and farthest-known Solar planet from the Sun.</li>
  </ul>
</panel>
<panel lang="css">
ul {
  max-width: 350px;
  margin-left: -20px;
}
#inner {
  list-style-position: inside;
}
#outer {
  list-style-position: outside; /* Default value */
}
</panel>
</code>
</Editor>

As can be seen in the example, the
list markers in the first list exist inside
the list items and the text flows from under them
in the subsequent lines. Whereas, in the second list,
the marker is clearly outside every list item and the
text doesn't go below it.