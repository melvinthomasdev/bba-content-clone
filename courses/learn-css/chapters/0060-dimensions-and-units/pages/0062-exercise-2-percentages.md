A space exploration company's website needs some improvements.

- The website's logo is represented by the class **logo**. The `height` of the logo should be **90%** of the header's height.
- Set the **width** of the **main** section to occupy **80%** of the **body** width.
- Set the **font-size** of the text within **main** to **90%** of its default size.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header>
  <img src="https://upload.wikimedia.org/wikipedia/commons/3/33/Cartoon_space_rocket.png" alt="Cosmic Explorations Logo" class="logo">
  <nav>
    <a href="#" class="nav-link">Home</a>
    <a href="#" class="nav-link">Missions</a>
    <a href="#" class="nav-link">About Us</a>
    <a href="#" class="nav-link">Contact</a>
  </nav>
</header>
<main>
  <h2>Your Ticket to the Stars</h2>
  <p>Join Cosmic Explorations on an exciting journey as we bring the wonders of the universe closer to you. Discover the latest missions that explore the mysteries beyond our planet.</p>
  <ul>
    <li>ISS Resupply Mission: Ensuring Astronauts Have Everything They Need</li>
    <li>Earth Observation Satellite Launch: Keeping an Eye on Our Home Planet</li>
    <li>Lunar Rover Exploration: Exploring the Moon's Terrain and Secrets</li>
    <li>Solar Orbiter Mission: Studying the Sun's Marvels from Afar</li>
  </ul>
</main>
</panel>
<panel language="css">
body {
  border: 2px solid;
  background-color: peachpuff;
}

header {
  background-color: #1a1a1a;
  height: 80px;
  display: flex;
  align-items: center;
  justify-content: space-around;
}

.logo {
  width: 100px;
}

nav {
  background-color: #2196F3;
  height: 40px;
  display: flex;
  align-items: center;
  margin-left: 100px;
}

.nav-link {
  margin: 10px;
  text-decoration: none;
  color: #fff;
}

main {
  padding: 20px;
  margin: 20px auto;
  background-color: coral;
  color: #000080;
}
</panel>
</code>

<solution>
body {
  border: 2px solid;
  background-color: peachpuff;
}

header {
  background-color: #1a1a1a;
  height: 80px;
  display: flex;
  align-items: center;
  justify-content: space-around;
}

.logo {
  width: 100px;
  height: 90%;
}

nav {
  background-color: #2196F3;
  height: 40px;
  display: flex;
  align-items: center;
  margin-left: 100px;
}

.nav-link {
  margin: 10px;
  text-decoration: none;
  color: #fff;
}

main {
  padding: 20px;
  margin: 20px auto;
  background-color: coral;
  color: #000080;
  width: 80%;
  font-size: 90%;
}
</solution>
</codeblock>
