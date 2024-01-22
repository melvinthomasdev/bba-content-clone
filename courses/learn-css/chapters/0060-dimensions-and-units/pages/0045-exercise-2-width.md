Set a width of `200px` to the `.sidebar` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1>Shoes Center</h1>
</div>

<div class="sidebar">
  <ul>
    <li><a href="#">Men</a></li>
    <li><a href="#">Women</a></li>
    <li><a href="#">Kids</a></li>
    <li><a href="#">Special Sizes</a></li>
  </ul>
</div>

<div class="content">
  <h2>Welcome to Shoes Center</h2>
  <p>Step into Style: Your Ultimate Shoes Store</p>
  <p>Discover the perfect blend of fashion and comfort at our shoes store. From trendy sneakers to elegant heels, we offer a wide selection to suit every style and occasion. Step up your footwear game and walk confidently with our premium collection.</p>
</div>

<div class="footer">
  <p>&copy; 2023 Shoes Center. All rights reserved.</p>
</div>
</panel>
<panel language="css">
.header,
.footer {
  background-color: black;
  color: white;
  text-align: center;
  padding: 20px;
}
.sidebar {
  background-color: #f0f0f0;
  float: left;
  padding: 18px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  margin-bottom: 10px;
}
.content {
  margin-left: 220px;
}
</panel>
</code>

<solution>
.header,
.footer {
  background-color: black;
  color: white;
  text-align: center;
  padding: 20px;
}
.sidebar {
  width: 200px;
  background-color: #f0f0f0;
  float: left;
  padding: 18px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  margin-bottom: 10px;
}
.content {
  margin-left: 220px;
}
</solution>
</codeblock>
