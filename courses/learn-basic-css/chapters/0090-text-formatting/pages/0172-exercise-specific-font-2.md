Apply `'San Francisco'` font to the
`.header-title` class,
 with a fallback to
`cursive, 'Helvetica Neue', Arial, sans-serif`.

Note: `'San Francisco'` is not publicly available
and cannot be used without purchasing the license;
hence, you should see the `cursive` fallback
font getting applied.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1 class="header-title">Design<span class="light-weight">o</span>Hub</h1>
  <div class="navbar">
    <ul class="nav-list">
      <li><a href="#" class="nav-link">Home</a></li>
      <li><a href="#" class="nav-link">Portfolio</a></li>
      <li><a href="#" class="nav-link">Services</a></li>
      <li><a href="#" class="nav-link">Contact</a></li>
    </ul>
  </div>
</div>

<div class="main-container">
  <div class="main-content">
    <h2 class="section-title">Unleash Your Creativity</h2>
    <p class="description">
      Explore our diverse range of design services and bring your ideas to life.
    </p>
    <button class="cta-button">Get Started</button>
  </div>
</div>

<div class="footer">
  <p class="footer-text">© 2023 DesignoHub. All rights reserved.</p>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  font-family: 'Helvetica Neue', Arial, sans-serif;
  background-color: #f9f9f9;
}

.header {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.header-title {
  font-size: 36px;
  margin: 0;
}

.light-weight {
  font-weight: lighter;
  color: #ff5722;
}

.navbar {
  margin-top: 20px;
}

nav-list {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-link {
  text-decoration: none;
  color: #fff;
  font-weight: 600;
  font-family: 'Open Sans', sans-serif;
  margin: 0 10px;
}

.main-container {
  padding: 50px;
  text-align: center;
}

.section-title {
  font-size: 28px;
  font-weight: bold;
  font-family: 'Playfair Display', serif;
}

.description {
  font-size: 18px;
  line-height: 1.6;
  color: #666;
  font-family: 'Roboto', sans-serif;
}

.cta-button {
  background-color: #2196f3;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 18px;
  cursor: pointer;
  margin-top: 20px;
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
}

.footer {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.footer-text {
  font-size: 14px;
  font-weight: 300;
  font-family: 'Lato', sans-serif;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  font-family: 'Helvetica Neue', Arial, sans-serif;
  background-color: #f9f9f9;
}

.header {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.header-title {
  font-size: 36px;
  font-family: 'San Francisco', cursive, 'Helvetica Neue', Arial, sans-serif;
  margin: 0;
}

.light-weight {
  font-weight: lighter;
  color: #ff5722;
}

.navbar {
  margin-top: 20px;
}

nav-list {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-link {
  text-decoration: none;
  color: #fff;
  font-weight: 600;
  font-family: 'Open Sans', sans-serif;
  margin: 0 10px;
}

.main-container {
  padding: 50px;
  text-align: center;
}

.section-title {
  font-size: 28px;
  font-weight: bold;
  font-family: 'Playfair Display', serif;
}

.description {
  font-size: 18px;
  line-height: 1.6;
  color: #666;
  font-family: 'Roboto', sans-serif;
}

.cta-button {
  background-color: #2196f3;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 18px;
  cursor: pointer;
  margin-top: 20px;
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
}

.footer {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.footer-text {
  font-size: 14px;
  font-weight: 300;
  font-family: 'Lato', sans-serif;
}
</solution>
</codeblock>
