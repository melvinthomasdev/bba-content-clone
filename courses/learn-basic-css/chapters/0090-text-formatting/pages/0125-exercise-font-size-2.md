Apply the following font sizes:

1. `font-size: 40px;` to the `.main-title` class.
2. `font-size: 80px;` to the `.fancy-title` class.
3. `font-size: 20px;` to the `.description` class.
4. `font-size: 18px;` to the `.cta-button` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <h1 class="main-title">Journey to the</h1>
  <h1 class="fancy-title">Unknown</h1>
  <p class="description">Embark on a quest to explore mysterious worlds and uncover hidden treasures.</p>
  <button class="cta-button">Start Journey</button>
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
  margin: 0;
}

.fancy-title {
  font-family: "Brush Script MT", cursive;
  margin: 0;
  color: #ff9800;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.description {
  line-height: 1.6;
  color: #666;
}

.cta-button {
  background-color: #2196f3;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
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
  margin: 0;
}

.fancy-title {
  font-family: "Brush Script MT", cursive;
  font-size: 80px;
  margin: 0;
  color: #ff9800;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
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
