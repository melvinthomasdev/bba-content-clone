In the code provided below,
add the following properties
to the **photo-gallery**:

- `display: grid`
- `grid-template-columns: 90px 90px 90px`

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1 class="heading">Photo Gallery</h1>
<div class="photo-gallery">
  <div>
    <img class="image" src="https://ucarecdn.com/a29f134d-6b1e-4d95-a2d3-0f57c34f4259/" alt="New York City">
  </div>
  <div>
    <img class="image" src="https://ucarecdn.com/5b78bbeb-d28a-4d97-8744-0f8dc8b53a05/" alt="Eiffel Tower Paris">
  </div>
  <div>
    <img class="image" src="https://ucarecdn.com/b0de0c9f-705d-41f8-8e4f-57266e93aaf8/" alt="Fort Kochi Beach Square">
  </div>
  <div>
    <img class="image" src="https://ucarecdn.com/96cdd519-8f8f-4609-80e2-7e0dbae38b6b/" alt="Munnar Kerala">
  </div>
  <div>
    <img class="image" src="https://ucarecdn.com/2b2cbeb7-8d93-467e-8b53-022b51071c6e/" alt="Zanskar River Ladakh">
  </div>
  <div>
    <img class="image" src="https://ucarecdn.com/55b63247-f656-40c6-bc5d-a21deb8ce149/" alt="Har Ki Doon Valley Uttarakhand">
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
