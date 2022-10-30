The background image for any element
retains its original size.
To adjust the image size,
we need to use the `background-size` property.

When this property is set to `cover`,
the image stretches or scales down in size
to fill the entire container:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <h1>
    Monsoon
  </h1>
  <p>
    A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
  </p>
</div>
</panel>
<panel lang="css">
div {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=400');
  /* Image stretches to occupy full space */
  background-size: cover;
}
</panel>
</code>
</Editor>

As you can see above, the image stretches
its width and height proportionately
to fill up the entire space.
If you resize the window,
you can see that the image
is either cropped at the bottom
or at the right.

If instead, we want the image to be fully visible,
the background size property can be set to `contain`:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <h1>
    Monsoon
  </h1>
  <p>
    A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
  </p>
</div>
</panel>
<panel lang="css">
div {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=200');

  /* Stretches as much as possible
  but shows full image */
  background-size: contain;
  background-repeat: no-repeat;
}
</panel>
</code>
</Editor>

We can also specify the exact width and height in pixels or percentage:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <h1>
    Monsoon
  </h1>
  <p>
    A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
  </p>
</div>
</panel>
<panel lang="css">
div {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=200');

  /* Width and height separated by a space */
  background-size: 300px 100px;
  background-repeat: no-repeat;
}
</panel>
</code>
</Editor>

If only one value is specified,
the width is set to that value
and height is auto-adjusted:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <h1>
    Monsoon
  </h1>
  <p>
    A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
  </p>
</div>
</panel>
<panel lang="css">
div {
  padding: 60px;
  background-image: url('https://images.pexels.com/photos/2512387/pexels-photo-2512387.jpeg?auto=compress&cs=tinysrgb&w=200');

  /* Width is 60% */
  background-size: 60%;
  background-repeat: no-repeat;
}
</panel>
</code>
</Editor>