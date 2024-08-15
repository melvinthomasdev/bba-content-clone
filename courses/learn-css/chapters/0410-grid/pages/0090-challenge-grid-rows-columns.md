Use the `grid-column` property to make
the image span both columns in the blog
content section.
The image should be displayed below the
paragraphs.
Use the `grid-row` property to position
the footer at the bottom of the page,
spanning both columns.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header>
  <h1>Trekking Adventure in the Mountains</h1>
  <p>Posted on March 4, 2024</p>
</header>

<section class="blog-content">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/har-ki-doon-valley-uttarakhand_tJ6flaLSZ.jpg" alt="Mountain Trek">
  <p>
    Trekking in the mountains is an exhilarating experience that offers a perfect blend of adventure, breathtaking landscapes, and a sense of accomplishment. Whether you are an avid trekker or a novice seeking a new challenge, the mountains have something magical to offer. In this blog post, we'll explore the beauty and thrill of a recent trekking adventure through the majestic peaks.
  </p>
  <p>
    Trekking in the mountains is more than just a physical activity; it's a transformative journey. The challenges, the beauty, and the camaraderie with fellow trekkers create an adventure that lingers in the heart and soul. If you're seeking an escape into the arms of nature and a challenge that pushes your limits, a trekking adventure in the mountains is an experience like no other.
  </p>
</section>

<footer>
  <p>Tags: #Trekking #Adventure #Mountains</p>
</footer>
</panel>
<panel language="css">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
}

header {
  background-color: #3498db;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.blog-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: auto auto auto; /* Add three rows */
  gap: 20px;
  padding: 20px;
}

img {
  width: 100%;
  height: auto;
}

footer {
  background-color: #3498db;
  color: #fff;
  text-align: center;
  padding: 10px;
}

</panel>
</code>
<solution>
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
}

header {
  background-color: #3498db;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.blog-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: auto auto auto; /* Add three rows */
  gap: 20px;
  padding: 20px;
}

img {
  width: 100%;
  height: auto;
  grid-column: 1 / span 2;
  grid-row: 2 / span 2;
}

footer {
  background-color: #3498db;
  color: #fff;
  text-align: center;
  padding: 10px;
  grid-column: 1 / span 2;
}
</solution>
</codeblock>
