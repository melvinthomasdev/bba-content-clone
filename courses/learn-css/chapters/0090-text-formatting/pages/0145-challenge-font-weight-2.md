Apply the following font weights:

1. `font-weight: 800;` to the `.header-title` class.
2. `font-weight: 600;` to the `.nav-link` class.
3. `font-weight: 500;` to the `.section-title` class.
4. `font-weight: 300;` to the `.footer-text` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1 class="header-title">Electronics and Gadgets</h1>
  <div class="main-nav">
    <ul class="nav-list">
      <li><a href="#" class="nav-link">Home</a></li>
      <li><a href="#" class="nav-link">About</a></li>
      <li><a href="#" class="nav-link">Services</a></li>
      <li><a href="#" class="nav-link">Contact</a></li>
    </ul>
  </div>
</div>

<div class="main-container">
  <div class="main-content">
    <h2 class="section-title">Welcome to Electronics and Gadgets</h2>
    <p class="description">
      Websites offering a wide range of electronic devices, gadgets, and tech accessories.
      Discover the latest in cutting-edge technology and innovation at our Electronics and Gadgets store. Explore a wide range of gadgets designed to simplify your life and enhance your digital experience.
    </p>
    <button class="cta-button">Get Started</button>
  </div>
</div>

<div class="footer">
  <p class="footer-text">© 2023 My Website. All rights reserved.</p>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
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

.main-nav {
  margin-top: 20px;
}

.nav-list {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
}

li {
  margin: 0 10px;
}

.nav-link {
  text-decoration: none;
  color: #fff;
}

.main-container {
  padding: 50px;
  text-align: center;
}

.section-title {
  font-size: 28px;
}

.description {
  font-size: 18px;
  line-height: 1.6;
  color: #666;
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
}

.footer {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.footer-text {
  font-size: 14px;
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
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
  font-weight: 800;
  margin: 0;
}

.main-nav {
  margin-top: 20px;
}

.nav-list {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
}

li {
  margin: 0 10px;
}

.nav-link {
  text-decoration: none;
  color: #fff;
  font-weight: 600;
}

.main-container {
  padding: 50px;
  text-align: center;
}

.section-title {
  font-size: 28px;
  font-weight: 500;
}

.description {
  font-size: 18px;
  line-height: 1.6;
  color: #666;
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
}
</solution>
</codeblock>
