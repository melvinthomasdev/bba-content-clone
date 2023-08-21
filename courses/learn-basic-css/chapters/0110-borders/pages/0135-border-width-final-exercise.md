Apply `border-bottom: 2px solid;`
to the `.header`, `.container`
and
`.footer` class elements.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header class="header">
  <h1>Shoes Center</h1>
</header>

<div class="container">
  <aside class="sidebar">
    <h2>Sidebar</h2>
    <ul>
      <li>Sneakers</li>
      <li>Sports</li>
      <li>Flip Flops</li>
    </ul>
  </aside>
  
  <main class="content">
    <h2>Step into Style: Your Ultimate Shoes Store</h2>
    <p> Your Ultimate Destination for Fashionable Footwear!</p>
  </main>
</div>

<footer class="footer">
  <p>&copy; 2023 Shoes Center. All rights reserved.</p>
</footer>
</panel>
<panel language="css">
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
}
.header, .container, .footer {
  background-color: gainsboro;
  padding: 20px;
}
.container {
  display: flex;
}
.sidebar {
  width: 25%;
  padding: 20px;
  background-color: #f5f5f5;
}
.content {
  flex: 1;
  padding: 20px;
}
.footer {
  text-align: center;
  background-color: #f5f5f5;
}
ul {
  list-style: none;
  padding: 0;
}
ul li {
  margin-bottom: 10px;
}
.header h1, .sidebar h2, .content h2, .footer p {
  margin: 0;
}
h1 {
  text-align: center;
}
</panel>
</code>

<solution>
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
}
.header, .container, .footer {
  background-color: gainsboro;
  padding: 20px;
  border-bottom: 2px solid;
}
.container {
  display: flex;
}
.sidebar {
  width: 25%;
  padding: 20px;
  background-color: #f5f5f5;
}
.content {
  flex: 1;
  padding: 20px;
}
.footer {
  text-align: center;
  background-color: #f5f5f5;
}
ul {
  list-style: none;
  padding: 0;
}
ul li {
  margin-bottom: 10px;
}
.header h1, .sidebar h2, .content h2, .footer p {
  margin: 0;
}
h1 {
  text-align: center;
}
</solution>
</codeblock>
