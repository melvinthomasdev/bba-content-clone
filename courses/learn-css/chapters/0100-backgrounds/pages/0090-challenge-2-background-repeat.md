Apply the following background repeat properties:

1. Set `no-repeat` for the div with the ID `#repeat-none`.
2. Apply `repeat-x` to the div with the ID `#repeat-x`.
3. Apply `repeat-y` to the div with the ID `#repeat-y`.
4. Use `repeat` for the div with the ID `#repeat`.


<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>Image Gallery</h1>
<div class="image-gallery">
  <div class="image" id="repeat-none"></div>
  <div class="image" id="repeat-x"></div>
  <div class="image" id="repeat-y"></div>
  <div class="image" id="repeat"></div>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  background-color: #f9f9f9;
}
h1 {
  font-family: 'Oswald', sans-serif;
  text-align: center;
  position: relative;
}
h1::before {
  content: '';
  position: absolute;
  background: orangered;
  width: 210px;
  height: 3px;
  bottom: -10px;
}
.image-gallery {
  display: flex;
  justify-content: center;
  align-items: center;
}
.image {
  background-image: url('https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/butterflies-bg-pattern_oVY9C5YmS.jpeg');
  width: 250px;
  height: 250px;
  margin: 10px;
  border: 1px solid #ccc;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  background-color: #f9f9f9;
}
h1 {
  font-family: 'Oswald', sans-serif;
  text-align: center;
  position: relative;
}
h1::before {
  content: '';
  position: absolute;
  background: orangered;
  width: 210px;
  height: 3px;
  bottom: -10px;
}
.image-gallery {
  display: flex;
  justify-content: center;
  align-items: center;
}
.image {
  background-image: url('https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/butterflies-bg-pattern_oVY9C5YmS.jpeg');
  width: 250px;
  height: 250px;
  margin: 10px;
  border: 1px solid #ccc;
}
#repeat-none {
  background-repeat: no-repeat;
}
#repeat-x {
  background-repeat: repeat-x;
}
#repeat-y {
  background-repeat: repeat-y;
}
#repeat {
  background-repeat: repeat;
}
</solution>
</codeblock>
