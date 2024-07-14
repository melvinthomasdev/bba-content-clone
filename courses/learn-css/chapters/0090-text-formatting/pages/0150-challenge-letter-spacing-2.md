Apply a letter spacing of `5px` to the `.sub-text` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <h1 class="main-title">
    C<span class="sub-text">r</span>eate
    A<span class="sub-text">m</span>azing
    D<span class="sub-text">e</span>signs
  </h1>
  <p class="description">
    Unleash your creativity and design unique masterpieces with us.
  </p>
  <button class="cta-button">Start Creating</button>
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
  font-size: 40px;
  text-transform: uppercase;
  letter-spacing: 10px;
  margin-bottom: 20px;
}

.sub-text {
  color: #ff9800;
}
.description {
  font-size: 20px;
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
  font-size: 40px;
  text-transform: uppercase;
  letter-spacing: 10px;
  margin-bottom: 20px;
}

.sub-text {
  letter-spacing: 5px;
  color: #ff9800;
}

.description {
  font-size: 20px;
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
