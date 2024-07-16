Add media queries to give a
maximum height of **400px**
to the `div` only for portrait
screen orientation:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
  background-image: url('https://images.pexels.com/photos/371589/pexels-photo-371589.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=800');
  background-size: cover;
}
</panel>
</code>

<solution>
div {
  height: 100vh;
  background-image: url('https://images.pexels.com/photos/371589/pexels-photo-371589.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=800');
  background-size: cover;
}
@media screen and (orientation: portrait) {
  div {
    max-height: 400px;
  }
}
</solution>
</codeblock>