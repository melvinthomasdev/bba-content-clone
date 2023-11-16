Assign the text decoration property of
`underline` to the element with the `.underline-text` class
and `line-through` to the element with the `.highlight-text` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <h1 class="main-title">
    The
    <span class="fancy-text">Enchanted</span>
    Journey
  </h1>

  <p class="description">
    Embark on a <span class="highlight-text">mystical</span> adventure through
    <span class="underline-text">wondrous</span> lands and
    <span class="fancy-text">magical</span> realms.
  </p>

  <button class="cta-button">Start Exploring</button>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f9f9f9;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 50px;
}

.main-title {
  font-size: 50px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 20px;
}

.fancy-text {
  font-family: "Cursive", cursive;
  font-size: 70px;
  color: #ff9800;
}

.highlight-text {
  background-color: #ffeb3b;
  padding: 2px 5px;
  border-radius: 5px;
}

.description {
  font-size: 20px;
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
</panel>
</code>

<solution>
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f9f9f9;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 50px;
}

.main-title {
  font-size: 50px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 20px;
}

.fancy-text {
  font-family: "Cursive", cursive;
  font-size: 70px;
  color: #ff9800;
}

.highlight-text {
  text-decoration: line-through;
  background-color: #ffeb3b;
  padding: 2px 5px;
  border-radius: 5px;
}

.underline-text {
  text-decoration: underline;
}

.description {
  font-size: 20px;
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
</solution>
</codeblock>
