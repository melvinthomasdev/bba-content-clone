In the code below apply
a **20px** offset to the
`about-section` element,
pushing it away from the left
edge of the screen.

Similarly, add **20px** offset
to the `contact-section` element,
moving it away from the right
edge of the screen.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="about-section">
    <h4>About Us</h4>
    <hr>
    <p>Welcome to our website! Learn more about our company and our mission.</p>
  </div>
  <div class="main-content">
    <h1>Welcome to Our Website</h1>
    <p>We are here to provide you with the best products and services.</p>
  </div>
  <aside class="contact-section">
    <h4>Contact Us</h4>
    <hr>
    <p>Get in touch with us for inquiries, support, or any questions you may have.</p>
  </aside>
  </div>
</panel>
<panel language="css">
body {
  width: 200vw;
  height: 95vh;
  font-family: sans-serif;
  background-color: #f1f1f1;
  overflow: auto;
  display: flex;
}

.container {
  display: flex;
}

.main-content {
  padding: 20px;
  width: 150vw;
}

.main-content > h1 {
  color: blueviolet;
}

.about-section {
  position: sticky;
  top: 20px;
  bottom: 20px;
  background-color: #3498db;
  color: white;
  padding: 10px;
  width: 5.5%;
}

.contact-section {
  position: sticky;
  top: 20px;
  bottom: 20px;
  background-color: #e74c3c;
  padding: 10px;
  width: 5.5%;
  color: white;
}
</panel>
</code>
<solution>
body {
  width: 200vw;
  height: 95vh;
  font-family: sans-serif;
  background-color: #f1f1f1;
  overflow: auto;
  display: flex;
}

.container {
  display: flex;
}

.main-content {
  padding: 20px;
  width: 150vw;
}

.main-content > h1 {
  color: blueviolet;
}

.about-section {
  position: sticky;
  top: 20px;
  bottom: 20px;
  background-color: #3498db;
  color: white;
  padding: 10px;
  width: 5.5%;
  left: 20px;
}

.contact-section {
  position: sticky;
  top: 20px;
  bottom: 20px;
  background-color: #e74c3c;
  padding: 10px;
  width: 5.5%;
  color: white;
  right: 20px;
}
</solution>
</codeblock>
