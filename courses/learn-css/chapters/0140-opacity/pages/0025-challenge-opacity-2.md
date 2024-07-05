On hover, change the card's opacity to `1` and its background color to `#ffffff`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="card">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/new-york-city_5gBb-QRzNV.jpg" alt="Image 1">
  <div class="content">
    <h3>New York City</h3>
    <p>Experience the vibrant culture and iconic landmarks of the Big Apple.</p>
  </div>
</div>

<div class="card">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/eiffel-tower-paris_-HBdDvLUA.jpg" alt="Image 2">
  <div class="content">
    <h3>Paris, France</h3>
    <p>Indulge in the romance and beauty of the City of Love.</p>
  </div>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.card {
  width: 300px;
  height: 400px;
  background-color: #f1f1f1;
  border-radius: 15px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: opacity 0.3s ease;
  position: relative;
  margin: 0 10px;
  opacity: 0.5;
  cursor: pointer;
}
.card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-radius: 15px 15px 0 0;
}
.content {
  padding: 15px;
}
h3 {
  margin-top: 0;
}
p {
  margin-bottom: 0;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.card {
  width: 300px;
  height: 400px;
  background-color: #f1f1f1;
  border-radius: 15px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: opacity 0.3s ease;
  position: relative;
  margin: 0 10px;
  opacity: 0.5;
  cursor: pointer;
}
.card:hover {
  opacity: 1;
  background-color: #ffffff;
}
.card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-radius: 15px 15px 0 0;
}
.content {
  padding: 15px;
}
h3 {
  margin-top: 0;
}
p {
  margin-bottom: 0;
}
</solution>
</codeblock>
