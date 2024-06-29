Apply the following background size properties to the specified divs:

1. Apply `top left` to the div with the ID `#image-top-left`.
2. Apply `top center` to the div with the ID `#image-top-center`.
3. Apply `top right` to the div with the ID `#image-top-right`.
4. Apply `center left` to the div with the ID `#image-center-left`.
5. Apply `center center` to the div with the ID `#image-center`.
6. Apply `center right` to the div with the ID `#image-center-right`.
7. Apply `bottom left` to the div with the ID `#image-bottom-left`.
8. Apply `bottom center` to the div with the ID `#image-bottom-center`.
9. Apply `bottom right` to the div with the ID `#image-bottom-right`."

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Image Gallery with different Background Positions</h2>
<div class="image-gallery">
  <div class="image" id="image-top-left"></div>
  <div class="image" id="image-top-center"></div>
  <div class="image" id="image-top-right"></div>
  <div class="image" id="image-center-left"></div>
  <div class="image" id="image-center"></div>
  <div class="image" id="image-center-right"></div>
  <div class="image" id="image-bottom-left"></div>
  <div class="image" id="image-bottom-center"></div>
  <div class="image" id="image-bottom-right"></div>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  background-color: #f0f0f0;
}
h2 {
  text-align: center;
  font-family: 'Oswald', sans-serif;
}
.image-gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
.image {
  background-image: url('https://ucarecdn.com/e9915d5f-c16a-41be-8672-e14b560ef413/');
  background-repeat: no-repeat;
  width: 320px;
  height: 200px;
  border: 1px solid #ccc;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  background-color: #f0f0f0;
}
h2 {
  text-align: center;
  font-family: 'Oswald', sans-serif;
}
.image-gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
.image {
  background-image: url('https://ucarecdn.com/e9915d5f-c16a-41be-8672-e14b560ef413/');
  background-repeat: no-repeat;
  width: 320px;
  height: 200px;
  border: 1px solid #ccc;
}
#image-top-left {
  background-position: top left;
}
#image-top-center {
  background-position: top center;
}
#image-top-right {
  background-position: top right;
}
#image-center-left {
  background-position: center left;
}
#image-center {
  background-position: center center;
}
#image-center-right {
  background-position: center right;
}
#image-bottom-left {
  background-position: bottom left;
}
#image-bottom-center {
  background-position: bottom center;
}
#image-bottom-right {
  background-position: bottom right;
}
</solution>
</codeblock>
