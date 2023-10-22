Assign a minimum width of `200px` to the `.sidebar` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="sidebar">
    <ul>
      <li><a href="javascript:void(0)">Home</a></li>
      <li><a href="javascript:void(0)">About Us</a></li>
      <li><a href="javascript:void(0)">Services</a></li>
      <li><a href="javascript:void(0)">Contact</a></li>
      <li><a href="javascript:void(0)">Privacy Policy</a></li>
    </ul>
  </div>
  <div class="content">
    <h1>Welcome to Our Shoes Center</h1>
    <p>Discover the perfect blend of fashion and comfort at our shoes store. From trendy sneakers to elegant heels, we offer a wide selection to suit every style and occasion. Step up your footwear game and walk confidently with our premium collection.</p>
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  background: lightcyan;
}
.sidebar {
  background-color: lightseagreen;
  color: white;
  padding: 20px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  margin-bottom: 10px;
}
a {
  text-decoration: none;
  color: #fff;
}
.content {
  flex: 1;
  padding: 20px;
}
h1 {
  color: lightseagreen;
}
</panel>
</code>

<solution>
.container {
  display: flex;
  background: lightcyan;
}
.sidebar {
  min-width: 200px;
  background-color: lightseagreen;
  color: white;
  padding: 20px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  margin-bottom: 10px;
}
a {
  text-decoration: none;
  color: #fff;
}
.content {
  flex: 1;
  padding: 20px;
}
h1 {
  color: lightseagreen;
}
</solution>
</codeblock>
