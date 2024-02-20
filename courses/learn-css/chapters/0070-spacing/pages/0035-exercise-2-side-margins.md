Apply the following margins to the `browser-card` class:

  1. Top Margin: **20px**
  2. Bottom Margin: **20px**
  3. Left Margin: **10px**
  4. Right Margin: **30px**

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="popular-browsers">
  <h1>Most Popular Browsers</h1>
  <div class="browser-card">
    <h2>Google Chrome</h2>
    <p>
      Google Chrome is a web browser developed by Google, released in 2008. Chrome is the world's most popular web browser today!
    </p>
  </div>
  <div class="browser-card">
    <h2>Mozilla Firefox</h2>
    <p>
      Mozilla Firefox is an open-source web browser developed by Mozilla. Firefox has been the second most popular web browser since January, 2018.
    </p>
  </div>
  <div class="browser-card">
    <h2>Microsoft Edge</h2>
    <p>
      Microsoft Edge is a web browser developed by Microsoft, released in 2015. Microsoft Edge replaced Internet Explorer.
    </p>
  </div>
</div>
</panel>
<panel language="css">
body {
  background-color: gainsboro;
}

h2, h3, h4, h5, h6, p {
  margin: 0;
}

.popular-browsers {
  padding: 30px;
}

.browser-card {
  background-color: white;
  padding: 10px 20px;
}
</panel>
</code>

<solution>
body {
  background-color: gainsboro;
}

h2, h3, h4, h5, h6, p {
  margin: 0;
}

.popular-browsers {
  padding: 30px;
}

.browser-card {
  background-color: white;
  padding: 10px 20px;
  margin-top: 20px;
  margin-bottom: 20px;
  margin-left: 10px;
  margin-right: 30px;
}
</solution>
</codeblock>
