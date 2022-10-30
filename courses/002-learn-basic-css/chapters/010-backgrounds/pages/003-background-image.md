An image can be added to
the background of any element
using the `background-image` property.

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
  background-image: url('https://images.pexels.com/photos/4913167/pexels-photo-4913167.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=600');
  padding: 30px;
  color: white;
}
</panel>
</code>
</Editor>

The image link needs to be specified within `url('')`.

In the above example, we used a large image.
But if the image is smaller than the size of the element,
the image repeats itself to cover the entire space
as shown in the example given below:

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
  background-image: url('https://images.pexels.com/photos/1114688/pexels-photo-1114688.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  padding: 30px;
  color: white;
}
</panel>
</code>
</Editor>