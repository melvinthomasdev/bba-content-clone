Apply the following colours to the text:

1. `white` colour to the `.header` class.
2. `red` colour to the `.heading` class.
3. `forestgreen` colour to the `.content-text`.
4. `blue` colour to the `.read-more` class.
5. `powderblue` colour to the `.footer` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1 class="heading">Welcome to Our Home and Furniture Decor</h1>
  <p>Website selling home decor, furniture, and furnishings for interior design needs.</p>
</div>

<div class="main-content">
  <h2 class="sub-heading">Explore the World of Elegant Home Decor</h2>
  <p class="content-text">Welcome to our Home and Furniture Store, where you'll discover an exquisite collection of furniture and home decor items to transform your living spaces.</p>
  <a href="#" class="read-more">Read More</a>
</div>

<div class="footer">
  <p>&copy; 2023 Home and Furniture Decor | All rights reserved.</p>
</div>
</panel>
<panel language="css">
.header {
  background-color: #333;
  text-align: center;
  padding: 50px 0;
}

.heading {
  font-size: 36px;
  margin-bottom: 10px;
}

.main-content {
  background-color: #fff;
  padding: 50px;
  text-align: center;
}

.sub-heading {
  color: red;
  font-size: 28px;
  margin-bottom: 20px;
}

.content-text {
  font-size: 18px;
  line-height: 1.6;
}

.read-more {
  display: block;
  font-size: 16px;
  margin-top: 20px;
  text-decoration: none;
}

.read-more:hover {
  text-decoration: underline;
}

.footer {
  background-color: #333;
  text-align: center;
  padding: 20px;
}
</panel>
</code>

<solution>
.header {
  background-color: #333;
  color: white;
  text-align: center;
  padding: 50px 0;
}

.heading {
  font-size: 36px;
  margin-bottom: 10px;
}

.main-content {
  background-color: #fff;
  padding: 50px;
  text-align: center;
}

.sub-heading {
  color: red;
  font-size: 28px;
  margin-bottom: 20px;
}

.content-text {
  color: forestgreen;
  font-size: 18px;
  line-height: 1.6;
}

.read-more {
  display: block;
  color: blue;
  font-size: 16px;
  margin-top: 20px;
  text-decoration: none;
}

.read-more:hover {
  text-decoration: underline;
}

.footer {
  background-color: #333;
  color: powderblue;
  text-align: center;
  padding: 20px;
}
</solution>
</codeblock>
