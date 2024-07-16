Apply the following margins to the `a` elements using `margin` shorthand property:

  1. Top Margin: **10px**
  2. Right Margin: **20px**
  2. Bottom Margin: **15px**
  3. Left Margin: **30px**

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="navbar">
    <a href="#">Home</a>
    <a href="#">About</a>
    <a href="#">Services</a>
    <a href="#">Contact</a>
</div>
</panel>
<panel language="css">
.navbar {
  background-color: darkslateblue;
  padding: 10px 0;
  text-align: center;
}

a {
  display: inline-block;
  color: white;
  text-decoration: none;
  padding: 8px 20px;
}
</panel>
</code>

<solution>
.navbar {
  background-color: darkslateblue;
  padding: 10px 0;
  text-align: center;
}

a {
  display: inline-block;
  color: white;
  text-decoration: none;
  padding: 8px 20px;
  margin: 10px 20px 15px 30px;
}
</solution>
</codeblock>
