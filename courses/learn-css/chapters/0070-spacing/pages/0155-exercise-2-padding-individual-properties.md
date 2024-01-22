Apply the following padding values to the `a` elements:

  1. Top padding: **10px**
  2. Bottom padding: **10px**
  3. Left padding: **30px**
  4. Right padding: **30px**

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="navbar">
  <a class="home" href="#">Home</a>
  <a class="about" href="#">About</a>
  <a class="services" href="#">Services</a>
  <a class="contact" href="#">Contact</a>
</div>
</panel>
<panel language="css">
.navbar {
  background-color: darkslateblue;
  text-align: center;
}

a {
  display: inline-block;
  color: white;
  text-decoration: none;
  margin: 5px;
}
</panel>
</code>

<solution>
.navbar {
  background-color: darkslateblue;
  text-align: center;
}

a {
  display: inline-block;
  color: white;
  text-decoration: none;
  margin: 5px;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-right: 30px;
  padding-left: 30px;
}
</solution>
</codeblock>
