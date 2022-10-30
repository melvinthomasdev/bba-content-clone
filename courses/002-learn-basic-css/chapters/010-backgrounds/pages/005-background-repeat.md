By default, the background image
repeats itself
horizontally and vertically,
if it's smaller than the element.
This can be changed using
the `background-repeat` property.

When this property is set to `no-repeat`,
the image does not repeat itself:

<Editor lang="css">
<code>
<panel lang="html">
<h1>
  Monsoon
</h1>
<p>
  A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
</p>
</panel>
<panel lang="css">
body {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=150');
  /* Image will not repeat */
  background-repeat: no-repeat;
}
</panel>
</code>
</Editor>

When the property is set to `repeat-x`,
it repeats itself only in the horizontal direction:

<Editor lang="css">
<code>
<panel lang="html">
<h1>
  Monsoon
</h1>
<p>
  A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
</p>
</panel>
<panel lang="css">
body {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=150');
  /* Repeats horizontally */
  background-repeat: repeat-x;
}
</panel>
</code>
</Editor>

When the property is set to `repeat-y`,
it repeats itself only in the vertical direction:

<Editor lang="css">
<code>
<panel lang="html">
<h1>
  Monsoon
</h1>
<p>
  A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
</p>
</panel>
<panel lang="css">
body {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=150');
  /* Repeats vertically */
  background-repeat: repeat-y;
}
</panel>
</code>
</Editor>