Set the **width** of the `content` class to **75%** of its
parent container's width and set the **font-size** to **90%**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="content">
    <h2>Explore the Cosmos</h2>
    <p>Embark on a journey through the cosmos, where stars, planets, and galaxies unveil the mysteries of the universe. Our telescope captures breathtaking images of distant celestial bodies, revealing the beauty and wonders beyond our world.</p>
  </div>
</div>
</panel>
<panel language="css">
body{
  margin: 0;
  background-color: lightgray;
}
.container {
  width: 80%;
  background-color: tomato;
  margin: 20px auto;
  padding: 20px;
}

.content {
  background-color: lightblue;
  padding: 15px;
  margin-top: 15px;
}
</panel>
</code>

<solution>
body{
  margin: 0;
  background-color: lightgray;
}
.container {
  width: 80%;
  background-color: tomato;
  margin: 20px auto;
  padding: 20px;
}

.content {
  width: 75%;
  font-size: 90%;
  background-color: lightblue;
  padding: 15px;
  margin-top: 15px;
}
</solution>
</codeblock>
