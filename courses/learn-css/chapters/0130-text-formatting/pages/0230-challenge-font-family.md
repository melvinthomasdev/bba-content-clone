Apply the following font families:

1. `'Helvetica Neue', sans-serif` to the `.header-title` class.
2. `'Open Sans', sans-serif` to the `a` tags of the navbar.
3. `'Roboto', sans-serif` to the `a` tags of the sidebar.
4. `'Oswald', sans-serif` to the `.section-title` class.
5. `'Montserrat', sans-serif` to the `.cta-button` class.
6. `'Lato', sans-serif` to the `.footer-text` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1 class="header-title">TechHub</h1>
  <div class="navbar">
    <ul class="nav-list">
      <li><a href="#" class="nav-link">Home</a></li>
      <li><a href="#" class="nav-link">Products</a></li>
      <li><a href="#" class="nav-link">Services</a></li>
      <li><a href="#" class="nav-link">Contact</a></li>
    </ul>
  </div>
</div>

<div class="sidebar-content-container">
  <div class="sidebar">
    <ul class="sidebar-list">
      <li><a href="#" class="sidebar-link">Laptops</a></li>
      <li><a href="#" class="sidebar-link">Smartphones</a></li>
      <li><a href="#" class="sidebar-link">Accessories</a></li>
    </ul>
  </div>

  <div class="content">
    <div class="main-content">
      <h2 class="section-title">Welcome to TechHub</h2>
      <p class="description">
        Explore a world of innovation and stay ahead with the latest gadgets and electronics.
      </p>
      <button class="cta-button">Shop Now</button>
    </div>
  </div>
</div>

<div class="footer">
  <p class="footer-text">© 2023 TechHub. All rights reserved.</p>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  font-family: 'Arial', sans-serif;
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

.navbar {
  margin-top: 20px;
}

.nav-list {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-link {
  text-decoration: none;
  color: white;
  font-weight: 600;
  margin: 0 10px;
}

.sidebar-content-container {
  display: flex;
}

.sidebar {
  background-color: #555;
  color: #fff;
  width: 250px;
  padding: 20px;
}

.sidebar-list {
  list-style: none;
  padding: 0;
}

.sidebar-link {
  text-decoration: none;
  color: white;
  font-weight: 500;
  margin-bottom: 10px;
}

.content {
  padding: 50px;
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
}
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  font-family: 'Arial', sans-serif;
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
  font-family: 'Helvetica Neue', sans-serif;
  margin: 0;
}

.navbar {
  margin-top: 20px;
}

.nav-list {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-link {
  text-decoration: none;
  color: white;
  font-family: 'Open Sans', sans-serif;
  font-weight: 600;
  margin: 0 10px;
}

.sidebar-content-container {
  display: flex;
}

.sidebar {
  background-color: #555;
  color: #fff;
  width: 250px;
  padding: 20px;
}

.sidebar-list {
  list-style: none;
  padding: 0;
}

.sidebar-link {
  text-decoration: none;
  color: white;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  margin-bottom: 10px;
}

.content {
  padding: 50px;
}

.section-title {
  font-size: 28px;
  font-family: 'Oswald', sans-serif;
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
  font-family: 'Lato', sans-serif;
  font-weight: 300;
}
</solution>
</codeblock>
