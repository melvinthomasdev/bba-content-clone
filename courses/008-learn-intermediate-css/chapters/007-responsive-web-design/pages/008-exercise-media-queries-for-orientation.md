Add media queries to give a
maximum height of **400px**
to the `div` only for portrait
screen orientation:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div></div>
</panel>
<panel lang="css">
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
</Editor>