Add offset `left` property with
a value of `30px`
and
`bottom` offset with a value of
`20px` to the button element
with the class `previous-page-button`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <p>BigBinary Academy</p>
  <nav>
    <ul class="nav-items">
      <li class="nav-item">Home</li>
      <li class="nav-item">About</li>
      <li class="nav-item">Contact</li>
    </ul>
  </nav>
</div>
<div class="content">
  <h1>Solar System</h1>
  <p>Our Solar system has 8 planets, here are the names:</p>
  <ol>
    <li>Mercury</li>
    <li>Venus</li>
    <li>Earth</li>
    <li>Mars</li>
    <li>Jupiter</li>
    <li>Saturn</li>
    <li>Uranus</li>
    <li>Neptune</li>
  </ol>
</div>
<div class="button-section">
  <button type="button" class="previous-page-button">Previous Page</button>
  <button type="button" class="confirm-button">Confirm</button>
</div>
</panel>
<panel language="css">
p {
  color: white;
  font-weight: 600;
  margin-top: 25px;
  font-size: 25px;
}
.header {
  display: flex;
  justify-content: space-around;
  background-color: #0043AC;
}
.nav-items {
  display: flex;
  list-style: none;
}
.nav-item {
  padding: 10px;
  margin: 5px;
  font-weight: 600;
  color: white
}
.content {
  margin: 40px;
  text-align: center;
}
.button-section {
  margin: 5px;
  display: flex;
  justify-content: space-between
}
button {
  border-radius: 20px;
  color: white;
  font-weight: bold;
  padding: 5px;
}
button:hover {
  box-shadow: 2px 2px lightgray;
}
.previous-page-button {
  background-color: #0043AC;
  color: white;
  font-weight: bold;
}
.confirm-button {
  background-color: green;
  color: white;
  font-weight: bold;
  position: relative;
  bottom: 20px;
}
</panel>
</code>

<solution>
p {
  color: white;
  font-weight: 600;
  margin-top: 25px;
  font-size: 25px;
}
.header {
  display: flex;
  justify-content: space-around;
  background-color: #0043AC;
}
.nav-items {
  display: flex;
  list-style: none;
}
.nav-item {
  padding: 10px;
  margin: 5px;
  font-weight: 600;
  color: white
}
.content {
  margin: 40px;
  text-align: center;
}
.button-section {
  margin: 5px;
  display: flex;
  justify-content: space-between
}
button {
  border-radius: 20px;
  color: white;
  font-weight: bold;
  padding: 5px;
}
button:hover {
  box-shadow: 2px 2px lightgray;
}
.previous-page-button {
  background-color: #0043AC;
  color: white;
  font-weight: bold;
  position: relative;
  left: 30px;
  bottom: 20px
}
.confirm-button {
  background-color: green;
  color: white;
  font-weight: bold;
  position: relative;
  bottom: 20px;
}
</solution>
</codeblock>
