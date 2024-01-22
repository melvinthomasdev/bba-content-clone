Update the code below
by adding a `nav` element
around list items in
`header`.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header>
  <img src="https://ucarecdn.com/f0c4b07d-25f4-44a6-96cb-5b2ccb460389/">
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</header>

<main>
	<h1>Whales</h1>

	<h3>Whales are protected by international law.</h3>
	<ul>
    <li><a href="https://en.wikipedia.org/wiki/Blue_whale">Blue Whale</a></li>
    <li><a href="https://en.wikipedia.org/wiki/Minke_whale">Minke Whale</a></li>
    <li><a href="https://en.wikipedia.org/wiki/Gray_whale">Gray Whales</a></li>
  </ul>
</main>

<footer>
  <p>©2023 BigBinary Academy</p>
</footer>
</panel>
<panel language="css" hidden="true">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
}

header {
  background-color: #3498db;
  color: #ffffff;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
}

header img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

header nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

header nav li {
  margin-right: 20px;
}

header nav a {
  text-decoration: none;
  color: #ffffff;
  font-weight: bold;
  font-size: 16px;
}

main {
  text-align: center;
  margin-top: 20px;
}

main h1 {
  color: #333;
}

main h3 {
  color: #555;
  font-size: 18px;
  line-height: 1.6;
}

main ul {
  list-style: none;
  padding: 0;
  margin-top: 20px;
}

main ul li {
  margin-bottom: 10px;
}

main ul li a {
  text-decoration: none;
  color: #3498db;
  font-weight: bold;
}

footer {
  background-color: #2c3e50;
  color: #ffffff;
  text-align: center;
  padding: 15px 0;
}

footer p {
  font-size: 16px;
}
</panel>
</code>

<solution>
<header>
  <img src="https://ucarecdn.com/f0c4b07d-25f4-44a6-96cb-5b2ccb460389/">

  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>
</header>

<main>
	<h1>Whales</h1>

	<h3>Whales are protected by international law.</h3>
  <ul>
    <li><a href="https://en.wikipedia.org/wiki/Blue_whale">Blue Whale</a></li>
    <li><a href="https://en.wikipedia.org/wiki/Minke_whale">Minke Whale</a></li>
    <li><a href="https://en.wikipedia.org/wiki/Gray_whale">Gray Whales</a></li>
  </ul>
</main>

<footer>
  <p>©2023 BigBinary Academy</p>
</footer>
</solution>
</codeblock>
