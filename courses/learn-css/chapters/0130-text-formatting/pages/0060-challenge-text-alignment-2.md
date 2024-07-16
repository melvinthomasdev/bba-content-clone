Apply text alignment of `right` to the `.left-text`
class and `left` to the `.right-text` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="left-text">
    <h1 class="main-heading">Discover</h1>
    <h2 class="sub-heading">The Magic</h2>
    <p class="small-text">of</p>
    <h1 class="main-heading">Words</h1>
  </div>

  <div class="right-text">
    <p class="content-text">Unleash your creativity with the power of words.</p>
    <p class="content-text">Join our immersive language and storytelling workshops.</p>
    <button>Explore Now</button>
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 50px;
}

.main-heading,
.sub-heading,
.small-text {
  margin: 0;
  line-height: 1;
  color: #333;
}

.main-heading {
  font-size: 80px;
}

.sub-heading {
  font-size: 60px;
  margin-top: 10px;
}

.content-text {
  font-size: 20px;
  line-height: 1.6;
  color: #666;
}

button {
  background-color: #333;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 18px;
  cursor: pointer;
}
</panel>
</code>

<solution>
.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 50px;
}

.left-text {
  text-align: right;
}

.main-heading,
.sub-heading,
.small-text {
  margin: 0;
  line-height: 1;
  color: #333;
}

.main-heading {
  font-size: 80px;
}

.sub-heading {
  font-size: 60px;
  margin-top: 10px;
}

.right-text {
  text-align: left;
}

.content-text {
  font-size: 20px;
  line-height: 1.6;
  color: #666;
}

button {
  background-color: #333;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 18px;
  cursor: pointer;
}
</solution>
</codeblock>
