Make the **overlay** div
fill up the entire horizontal
and vertical space
with `20px` offset at the
top and bottom.

Use the `inset` property
to set these values:<br>
Top & Bottom: `20px`<br>
Right & Left: `0px`

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="parent">
  <div id="overlay">
    Travel Destinations
  </div>
</div>
</panel>
<panel language="css">
#parent {
  position: relative;
  height: 300px;
  background-image: url('https://images.pexels.com/photos/371589/pexels-photo-371589.jpeg?auto=compress&cs=tinysrgb&w=600');
  background-size: cover;
}
#overlay {
  position: absolute;
  background-color: rgba(0, 0, 0, 0.6);
  padding: 30px;
  font-size: 3rem;
  color: white;
  text-align: center;
}
</panel>
</code>

<solution>
#parent {
  position: relative;
  height: 300px;
  background-image: url('https://images.pexels.com/photos/371589/pexels-photo-371589.jpeg?auto=compress&cs=tinysrgb&w=600');
  background-size: cover;
}
#overlay {
  position: absolute;
  background-color: rgba(0, 0, 0, 0.6);
  padding: 30px;
  font-size: 3rem;
  color: white;
  text-align: center;
  inset: 20px 0px;
}
</solution>
</codeblock>