Make the **overlay** `div` fill up the entire
space by setting the `top`, `right`, `bottom`
and
`left` values to `0`:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div id="parent">
  <div id="overlay">
    Travel Destinations
  </div>
</div>
</panel>
<panel lang="css">
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
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
</solution>
</Editor>