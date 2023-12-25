Add `position` as **sticky**
and
`bottom` as **20px** to the
`div` element with class `footer`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <p>BigBinary Academy</p>
  <div>
    <ul class="nav">
      <li>Home</li>
      <li>About</li>
      <li>Contact</li>
    </ul>
  </div>
</div>
<div class="content">
  <h1>Mammals</h1>
  <br>

  <h3>Dog</h3>
  <p>The dog is a domesticated descendant of the wolf. Also called the domestic dog, it is derived from extinct Pleistocene wolves, and the modern wolf is the dog's nearest living relative.</p>
  <br>

  <h3>Cat</h3>
  <p>Female domestic cats can have kittens from spring to late autumn in temperate zones and throughout the year in equatorial regions, with litter sizes often ranging from two to five kittens. Domestic cats are bred and shown at events as registered pedigreed cats, a hobby known as cat fancy.</p>
  <br>

  <h3>Cow</h3>
  <p>Cows are commonly raised as livestock for meat, for milk, and for hides, which are used to make leather. They are used as riding animals and draft animals.</p>
  <br>

  <h3>Sheep</h3>
  <p>Sheep are most likely descended from the wild mouflon of Europe and Asia, with Iran being a geographic envelope of the domestication center. One of the earliest animals to be domesticated for agricultural purposes, sheep are raised for fleeces, meat and milk.</p>
</div>
<div class="footer">
  <p>©2023 BigBinary Academy</p>
</div>
</panel>
<panel language="css">
body {
  background: #f9f9f9;
  font-family: sans-serif;
  box-sizing: border-box;
  height: 200vh;
}

.header {
  background: blueviolet;
  color: #f4f4f4;
  padding: 10px;
  font-weight: bold;
  display: flex;
  justify-content: space-around;
  align-items: center;
  position: sticky;
  top: 10px;
}

.header > p {
  background: blueviolet;
  font-weight: bold;
  margin: 5px;
  padding: 5px;
}

.nav {
  display: flex;
  list-style: none;
}

.nav > li {
  margin: 5px;
  padding: 5px;
}

.content {
  padding: 20px;
}
.content > h3 {
  color: blueviolet;
}
.footer {
  box-sizing: border-box;
  color: #f4f4f4;
  padding: 20px;
  background: blueviolet;
  text-align: center;
  font-weight: bold;
}

.footer > p {
  font-weight: bold;
}
</panel>
</code>
<solution>
body {
  background: #f9f9f9;
  font-family: sans-serif;
  box-sizing: border-box;
  height: 200vh;
}

.header {
  background: blueviolet;
  color: #f4f4f4;
  padding: 10px;
  font-weight: bold;
  display: flex;
  justify-content: space-around;
  align-items: center;
  position: sticky;
  top: 10px;
}

.header > p {
  background: blueviolet;
  font-weight: bold;
  margin: 5px;
  padding: 5px;
}

.nav {
  display: flex;
  list-style: none;
}

.nav > li {
  margin: 5px;
  padding: 5px;
}

.content {
  padding: 20px;
}
.content > h3 {
  color: blueviolet;
}
.footer {
  box-sizing: border-box;
  color: #f4f4f4;
  padding: 10px;
  background: blueviolet;
  text-align: center;
  font-weight: bold;
  position: sticky;
  bottom: 10px;
}

.footer > p {
  font-weight: bold;
}
</solution>
</codeblock>
