Apply the following background size properties for the specified divs:

1. Apply `cover` to the div with the ID `#image-cover`.
2. Apply `contain` to the div with the ID `#image-contain`.
3. Set the size to `200px 150px` for the div with the ID `#image-custom-size`.
4. Apply `auto` to the div with the ID `#image-auto`."


<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>Nature Gallery</h1>
<div class="image-gallery">
  <div class="image" id="image-cover"></div>
  <div class="image" id="image-contain"></div>
  <div class="image" id="image-custom-size"></div>
  <div class="image" id="image-auto"></div>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  background-color: #f0f0f0;
}
h1 {
  text-align: center;
}
.image-gallery {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
.image {
  background-image: url('https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/nature_F55HkPWpq.jpg');
  width: 300px;
  height: 200px;
  margin: 10px;
  background-repeat: no-repeat;
  border: 1px solid #ccc;
}
#image-custom-size {
  background-position: center;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  background-color: #f0f0f0;
}
h1 {
  text-align: center;
}
.image-gallery {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
.image {
  background-image: url('https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/nature_F55HkPWpq.jpg');
  width: 300px;
  height: 200px;
  margin: 10px;
  background-repeat: no-repeat;
  border: 1px solid #ccc;
}
#image-cover {
  background-size: cover;
}
#image-contain {
  background-size: contain;
}
#image-custom-size {
  background-size: 200px 150px;
  background-position: center;
}
#image-auto {
  background-size: auto;
}
</solution>
</codeblock>
