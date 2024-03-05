Apply a margin of **-50px** below the `header` and
a margin of **-30px** above the `footer`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="header">
    <h1>Welcome to Our Website</h1>
  </div>
  <div class="content">
    <p>This is a simple example demonstrating the use of negative margins.</p>
  </div>
  <div class="footer">
    <p>Contact us at: contact@example.com</p>
  </div>
</div>
</panel>
<panel language="css">
.container {
  width: 600px;
  margin: 50px auto;
  border: 1px solid #333;
  padding: 20px;
}

.header {
  background-color: #3498db;
  color: white;
  padding: 10px;
  text-align: center;
}

.content {
  background-color: #f1c40f;
  color: white;
  padding: 20px;
  text-align: center;
}

.footer {
  background-color: #27ae60;
  color: white;
  padding: 10px;
  text-align: center;
}
</panel>
</code>

<solution>
.container {
  width: 600px;
  margin: 50px auto;
  border: 1px solid #333;
  padding: 20px;
}

.header {
  background-color: #3498db;
  color: white;
  padding: 10px;
  text-align: center;
  margin-bottom: -50px;
}

.content {
  background-color: #f1c40f;
  color: white;
  padding: 20px;
  text-align: center;
}

.footer {
  background-color: #27ae60;
  color: white;
  padding: 10px;
  text-align: center;
  margin-top: -30px;
}
</solution>
</codeblock>
