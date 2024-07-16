Make the items within the `nav`
element fully spaced out
using `justify-content`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<nav>
  <a href="#">Dashboard</a>
  <h1>Brand Logo</h1>
  <a href="#">Logout</a>
</nav>
</panel>
<panel language="css">
* {
  padding: 0;
  margin: 0;
}
nav {
  display: flex;
  padding: 10px 20px;
  background-color: #222222;
  color: white;
}
nav a {
  color: white;
  text-decoration: none;
  line-height: 30px;
}
</panel>
</code>

<solution>
* {
  padding: 0;
  margin: 0;
}
nav {
  display: flex;
  justify-content: space-between;
  padding: 10px 20px;
  background-color: #222222;
  color: white;
}
nav a {
  color: white;
  text-decoration: none;
  line-height: 30px;
}
</solution>
</codeblock>