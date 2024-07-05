Apply the following padding values to the `img` elements using the `padding` shorthand property:

  1. Top padding: **25px**
  2. Right padding: **15px**
  2. Bottom padding: **20px**
  3. Left padding: **10px**

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="image-gallery">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/bmw_yuDvqfcM-.jpg" alt="BMW">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/lambo_CPCbQmsxW.jpg" alt="Lamborghini">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/mazda_OqP8oBu-Y.jpg" alt="Infinity">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/benz_0uwhxzP20.jpg" alt="Mercedes Benz">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/isuzu-dmax_RtvT4Md5kW.jpg" alt="Isuzu D-max">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/maserati_yijfJG5iOw.jpg" alt="Maserati">
</div>
</panel>
<panel language="css">
.image-gallery {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 10px;
}

img {
  width: 250px;
  height: auto;
  background-color: gold;
  border: 1px solid red;
  margin-bottom: 20px;
}
</panel>
</code>

<solution>
.image-gallery {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 10px;
}

img {
  width: 250px;
  height: auto;
  background-color: gold;
  border: 1px solid red;
  margin-bottom: 20px;
  padding: 25px 15px 20px 10px;
}
</solution>
</codeblock>
