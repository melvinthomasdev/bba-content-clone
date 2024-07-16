Apply the following Border colors:

- `#3498db` to the `.solid-border` class.
- `#e74c3c` to the `.dashed-border` class.
- `#2ecc71` to the `.dotted-border` class.
- `#f39c12` to the `.double-border` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="profile-card solid-border">
    <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/men-avatar%20(1)_VJe2C64nS.jpeg" alt="Profile 1">
    <h2>Steph Curry</h2>
    <p>Web Developer</p>
  </div>
  <div class="profile-card dashed-border">
    <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/gentlemen-avatar_xmq1EJDwU.png" alt="Profile 2">
    <h2>Lebron James</h2>
    <p>Graphic Designer</p>
  </div>
  <div class="profile-card dotted-border">
    <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/gentlemen-avatar_xmq1EJDwU.png" alt="Profile 3">
    <h2>Klay Thompson</h2>
    <p>Software Engineer</p>
  </div>
  <div class="profile-card double-border">
    <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/men-avatar%20(1)_VJe2C64nS.jpeg" alt="Profile 4">
    <h2>Kobe Bryant</h2>
    <p>UI/UX Designer</p>
  </div>
</div>
</panel>
<panel language="css">
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  max-width: 1000px;
  margin: 0 auto;
}
.profile-card {
  width: 250px;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.3s ease;
}
.profile-card:hover {
  transform: translateY(-10px);
}
.profile-card img {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 50%;
  margin-bottom: 10px;
}
.solid-border {
  border: 2px solid;
}
.dashed-border {
  border: 2px dashed;
}
.dotted-border {
  border: 2px dotted;
}
.double-border {
  border: 4px double;
}
</panel>
</code>

<solution>
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  max-width: 1000px;
  margin: 0 auto;
}
.profile-card {
  width: 250px;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.3s ease;
}
.profile-card:hover {
  transform: translateY(-10px);
}
.profile-card img {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 50%;
  margin-bottom: 10px;
}
.solid-border {
  border: 2px solid #3498db;
}
.dashed-border {
  border: 2px dashed #e74c3c;
}
.dotted-border {
  border: 2px dotted #2ecc71;
}
.double-border {
  border: 4px double #f39c12;
}
</solution>
</codeblock>
