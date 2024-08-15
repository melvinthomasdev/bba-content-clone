In the code provided below,
add the following properties
to the **photo-gallery**:

- `display: grid`
- `grid-template-columns: 200px 200px 200px`

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1 class="heading">Photo Gallery</h1>
<div class="photo-gallery">
  <div>
    <img class="image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/new-york-city_5gBb-QRzNV.jpg" alt="New York City">
  </div>
  <div>
    <img class="image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/eiffel-tower-paris_-HBdDvLUA.jpg" alt="Eiffel Tower Paris">
  </div>
  <div>
    <img class="image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/fort-kochi-beach-square_TlUcZ6rQP.jpg" alt="Fort Kochi Beach Square">
  </div>
  <div>
    <img class="image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/munnar-kerala-06_F2-gpq7yc.jpg" alt="Munnar Kerala">
  </div>
  <div>
    <img class="image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/zanskar-river-ladakh_Y-rL9FsDb.jpg" alt="Zanskar River Ladakh">
  </div>
  <div>
    <img class="image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/har-ki-doon-valley-uttarakhand_tJ6flaLSZ.jpg" alt="Har Ki Doon Valley Uttarakhand">
  </div>
</div>
</panel>
<panel language="css">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f8f8f8;
  color: #333;
}

.heading {
  text-align: center;
}

.photo-gallery {
  justify-content: center;
}

.image {
width: 100%;
height: 150px;
}
</panel>
</code>
<solution>
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f8f8f8;
  color: #333;
}
.heading {
  text-align: center;
}

.photo-gallery {
  justify-content: center;
  display: grid;
  grid-template-columns: 200px 200px 200px;
}

.image {
  width: 100%;
  height: 150px;
}
</solution>
</codeblock>
