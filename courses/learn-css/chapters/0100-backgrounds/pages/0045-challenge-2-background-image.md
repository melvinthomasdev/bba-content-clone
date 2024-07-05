Set the following image URL as the background image for the `.header` class: https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/explore-now_NaO4g2Dfg.jpg

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <div class="overlay">
    <div class="logo">Trekking Adventures</div>
    <nav class="navbar">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </nav>
  </div>
</div>

<div class="content">
  <h1>Trekking Adventures: Explore the Great Outdoors</h1>
  <p>Embrace the Thrill of Trekking and Conquer Majestic Peaks.</p>
</div>
</panel>
<panel language="css">
.header {
  background-size: cover;
  background-position: center;
  height: 400px;
  color: white;
}
.overlay {
  background-color: rgba(0, 0, 0, 0.5);
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.logo {
  font-size: 24px;
  font-weight: bold;
}
.navbar {
  margin-top: 10px;
}
.navbar ul {
  list-style: none;
  padding: 0;
  display: flex;
}
.navbar li {
  margin-right: 20px;
}
.navbar li a {
  text-decoration: none;
  color: white;
}
.content {
  padding: 20px;
}
h1 {
  color: #333;
}
p {
  color: #555;
}
</panel>
</code>

<solution>
.header {
  background-image: url("https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/explore-now_NaO4g2Dfg.jpg");
  background-size: cover;
  background-position: center;
  height: 400px;
  color: white;
}
.overlay {
  background-color: rgba(0, 0, 0, 0.5);
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.logo {
  font-size: 24px;
  font-weight: bold;
}
.navbar {
  margin-top: 10px;
}
.navbar ul {
  list-style: none;
  padding: 0;
  display: flex;
}
.navbar li {
  margin-right: 20px;
}
.navbar li a {
  text-decoration: none;
  color: white;
}
.content {
  padding: 20px;
}
h1 {
  color: #333;
}
p {
  color: #555;
}
</solution>
</codeblock>
