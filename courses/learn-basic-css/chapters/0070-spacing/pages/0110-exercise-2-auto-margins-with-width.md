Apply margin `auto`, and a `width` of **80%** to the `.site-content` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1>Welcome to Shoes Center</h1>
  <p>Step into Style and Comfort at Our Shoes Center.</p>
</div>
<div class="navbar">
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Services</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</div>
<div class="site-content">
  <h2>About Us</h2>
  <p>Discover the perfect blend of fashion and comfort at our Shoes Center. From trendy sneakers to elegant heels, we offer an extensive collection of footwear to cater to every taste and occasion.</p>
</div>
</panel>
<panel language="css">
.header {
  background-color: #007bff;
  color: #fff;
  text-align: center;
  padding: 20px 0;
}

h1 {
  font-size: 2em;
  margin: 0;
}

.navbar {
  background-color: #f0f0f0;
  text-align: center;
  padding: 10px 0;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

li {
  display: inline-block;
  margin-right: 20px;
}

a {
  color: #007bff;
  text-decoration: none;
}

.site-content {
  padding: 20px;
}

h2 {
  color: #007bff;
}

p {
  line-height: 1.6;
}
</panel>
</code>

<solution>
.header {
  background-color: #007bff;
  color: #fff;
  text-align: center;
  padding: 20px 0;
}

h1 {
  font-size: 2em;
  margin: 0;
}

.navbar {
  background-color: #f0f0f0;
  text-align: center;
  padding: 10px 0;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

li {
  display: inline-block;
  margin-right: 20px;
}

a {
  color: #007bff;
  text-decoration: none;
}

.site-content {
  width: 80%;
  margin: auto;
  padding: 20px;
}

h2 {
  color: #007bff;
}

p {
  line-height: 1.6;
}
</solution>
</codeblock>
