Modify the code by adding
`grid-template-rows` property
with a value of `auto 1fr`
to the class **main-header**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header class="main-header">
  <nav class="main-nav">
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>
  <div class="hero-section">
    <h1>Welcome to Our Website</h1>
    <p>Discover the best services tailored just for you.</p>
  </div>
</header>
</panel>
<panel language="css">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
}

.main-header {
  display: grid;
  background-color: #3498db;
  padding-top: 40px;
  height: 100vh;
}

.main-nav {
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
}

.main-nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.main-nav li {
  margin-right: 20px;
}

.main-nav a {
  text-decoration: none;
  color: #fff;
  font-weight: bold;
  font-size: 16px;
}

.hero-section {
  margin-top: 50px;
  text-align: center;
  background-color: #f4f4f4;;
}

.hero-section h1 {
  font-size: 36px;
  margin-bottom: 10px;
}

.hero-section p {
  font-size: 18px;
  color: #949494;
}
</panel>
</code>
<solution>
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
}

.main-header {
  display: grid;
  grid-template-rows: auto 1fr;
  background-color: #3498db;
  padding-top: 40px;
  height: 100vh;
}

.main-nav {
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
}

.main-nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.main-nav li {
  margin-right: 20px;
}

.main-nav a {
  text-decoration: none;
  color: #fff;
  font-weight: bold;
  font-size: 16px;
}

.hero-section {
  margin-top: 50px;
  text-align: center;
  background-color: #f4f4f4;;
}

.hero-section h1 {
  font-size: 36px;
  margin-bottom: 10px;
}

.hero-section p {
  font-size: 18px;
  color: #949494;
}
</solution>
</codeblock>
