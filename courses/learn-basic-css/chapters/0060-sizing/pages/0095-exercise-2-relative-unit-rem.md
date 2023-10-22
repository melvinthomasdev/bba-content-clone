Apply the following properties:

1. Set a `padding` of `2rem` for the `.header` class.
2. Assign a `font-size` of `2.5rem` and a `margin-bottom` of `1rem` to all `<h1>` elements.
3. Apply a `padding` of `1rem` to the `.footer` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="header">
    <h1>Shoes Center</h1>
    <p>Explore our products and services</p>
  </div>

  <div class="navigation">
    <ul>
      <li><a href="javascript:void(0)">Men</a></li>
      <li><a href="javascript:void(0)">Women</a></li>
      <li><a href="javascript:void(0)">Kids</a></li>
      <li><a href="javascript:void(0)">Special Sizes</a></li>
    </ul>
  </div>

  <div class="content">
    <h2>Welcome to Shoes Center</h2>
    <p>Step into Style: Your Ultimate Shoes Store</p>
    <p>Discover the perfect blend of fashion and comfort at our shoes store.</p>
  </div>

  <div class="footer">
    <p>&copy; 2023 Shoes Center. All rights reserved.</p>
  </div>
</div>
</panel>
<panel language="css">
.container {
  max-width: 800px;
  margin: 0 auto;
}
.header {
  background-color: black;
  color: white;
  text-align: center;
}
.navigation {
  background-color: #f0f0f0;
  float: left;
  width: 200px;
  padding: 1rem;
}
ul {
  list-style: none;
  padding: 0;
}
.content {
  margin-left: 220px;
}
.footer {
  background-color: black;
  color: white;
  text-align: center;
}
</panel>
</code>

<solution>
.container {
  max-width: 800px;
  margin: 0 auto;
}
.header {
  background-color: black;
  color: white;
  text-align: center;
  padding: 2rem;
}
h1 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}
.navigation {
  background-color: #f0f0f0;
  float: left;
  width: 200px;
  padding: 1rem;
}
ul {
  list-style: none;
  padding: 0;
}
.content {
  margin-left: 220px;
}
.footer {
  background-color: black;
  color: white;
  text-align: center;
  padding: 1rem;
}
</solution>
</codeblock>
