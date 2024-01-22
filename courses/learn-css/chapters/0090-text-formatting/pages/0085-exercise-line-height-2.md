Apply the following line-heights:

1. `line-height: 1.8;` to the `.main-content` class.
2. `line-height: 56px;` to the `h1` element.
2. `line-height: 1.2;` to the `h2` element.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="main-content">
    <h1>Discover</h1>
    <h2>The Magic</h2>
    <p class="description">
      Unleash your creativity and embark on an enchanting journey
      through the <span class="highlight">world of imagination.</span>
    </p>
    <button class="cta-button">Start Exploring</button>
  </div>

  <div class="image">
    <img src="https://ucarecdn.com/52ec812a-e5eb-49c9-9ed4-600421b23e31/" alt="Magic Forest">
  </div>
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
  align-items: center;
  padding: 50px;
}

.main-content {
  flex: 1;
}

h1 {
  font-size: 48px;
  margin: 0;
}

h2 {
  font-size: 36px;
  margin: 0;
}

.description {
  font-size: 18px;
  color: #666;
}

.highlight {
  background-color: #ffeb3b;
  padding: 2px 5px;
  border-radius: 5px;
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

.image {
  flex: 1;
  text-align: center;
}

img {
  max-width: 100%;
  border-radius: 10px;
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
  align-items: center;
  padding: 50px;
}

.main-content {
  flex: 1;
  line-height: 1.8;
}

h1 {
  font-size: 48px;
  margin: 0;
  line-height: 56px;
}

h2 {
  font-size: 36px;
  margin: 0;
  line-height: 1.2;
}

.description {
  font-size: 18px;
  color: #666;
}

.highlight {
  background-color: #ffeb3b;
  padding: 2px 5px;
  border-radius: 5px;
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

.image {
  flex: 1;
  text-align: center;
}

img {
  max-width: 100%;
  border-radius: 10px;
}
</solution>
</codeblock>
