Set the padding of the `<p>` tag to be twice its font size, using `em` units.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <h1>Discover My Creative Journey</h1>
  <p>
    Welcome to my portfolio, where I showcase my creative journey and the culmination of my passion and skills. Through a collection of projects and designs, I aim to inspire and leave a lasting impression. Explore my work to witness the fusion of artistry and innovation, as I strive to make a positive impact through thoughtful design solutions. Let's connect and collaborate to bring your ideas to life!
  </p>
</div>
</panel>
<panel language="css">
.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #f0f0f0;
  font-size: 16px;
}
h1 {
  font-size: 1.5em;
  color: #4CAF50;
}
p {
  font-size: 1em;
  line-height: 1.6;
  background: ghostwhite;
}
</panel>
</code>

<solution>
.container {
  max-width: 600px;
  margin: 0 auto;
  background-color: #f0f0f0;
  font-size: 16px;
}
h1 {
  font-size: 1.5em;
  color: #4CAF50;
}
p {
  font-size: 1em;
  line-height: 1.6;
  background: ghostwhite;
  padding: 2em;
}
</solution>
</codeblock>
