Make the following changes to the background colours:

1. Change the background colour of the `.header` class to`#2c3e50`.
2. Update the background colour of the `.content` class to `gainsboro`.
3. Update the background colour of the `.footer` class to `lightblue`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <div class="logo">Shoes Center</div>
  <div class="navbar">
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </div>
</div>

<div class="content">
  <h1>Welcome to Shoes Center</h1>
  <p>Step into Style: Your Ultimate Shoes Store.</p>
</div>

<div class="footer">
  <p>&copy; 2023 Shoes Center. All rights reserved.</p>
</div>
</panel>
<panel language="css">
.header {
  background-color: #333;
  color: #fff;
  padding: 20px;
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
  color: #fff;
}
.content {
  background-color: #f0f0f0;
  padding: 20px;
}
h1 {
  color: #333;
}
p {
  color: #555;
}
.footer {
  background-color: #222;
  color: #fff;
  padding: 10px;
  text-align: center;
}
.footer p {
  color: white;
}
</panel>
</code>

<solution>
.header {
  background-color: #2c3e50;
  color: #fff;
  padding: 20px;
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
  color: #fff;
}
.content {
  background-color: gainsboro;
  padding: 20px;
}
h1 {
  color: #333;
}
p {
  color: #555;
}
.footer {
  background-color: lightblue;
  color: #fff;
  padding: 10px;
  text-align: center;
}
.footer p {
  color: white;
}
</solution>
</codeblock>
