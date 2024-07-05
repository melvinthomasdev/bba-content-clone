Set the height of the `.hero` class to `100vh`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="hero">
  <div class="hero-content">
    <h1>Explore the World of Adventure</h1>
    <p>Unleash Thrills and Discover Wonders</p>
    <a href="#" class="cta-button">Explore Now</a>
  </div>
</div>
</panel>
<panel language="css">
.hero {
  background: url(https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/explore-now_NaO4g2Dfg.jpg) center;
  background-size: cover;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: #fff;
}
.hero-content {
  max-width: 600px;
  padding: 20px;
  margin: auto;
}
h3 {
  font-size: 4rem;
  margin-bottom: 20px;
}
p {
  font-size: 1.5rem;
  margin-bottom: 30px;
}
.cta-button {
  padding: 10px 30px;
  font-size: 1.2rem;
  background-color: #ff6600;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
}
</panel>
</code>

<solution>
.hero {
  height: 100vh;
  background: url(https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/explore-now_NaO4g2Dfg.jpg) center;
  background-size: cover;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: #fff;
}
.hero-content {
  max-width: 600px;
  padding: 20px;
  margin: auto;
}
h3 {
  font-size: 4rem;
  margin-bottom: 20px;
}
p {
  font-size: 1.5rem;
  margin-bottom: 30px;
}
.cta-button {
  padding: 10px 30px;
  font-size: 1.2rem;
  background-color: #ff6600;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
}
</solution>
</codeblock>
