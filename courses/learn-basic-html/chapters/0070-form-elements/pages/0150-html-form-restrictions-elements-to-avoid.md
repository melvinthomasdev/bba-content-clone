Avoid using the following
HTML elements directly inside
a `<form>`:
- p
- div
- h1 to h6
- a

**Avoid this:**
<codeblock language="html" type="lesson">
<code>
<form action="/submit" method="post">
  <h2>Personal Information</h2>
  <p>First Name:</p>
  <input id="first-name" type="text" />
  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

**Instead, do this:**
<codeblock language="html" type="lesson">
<code>
<div class="form-container">
  <form action="/submit" method="post">
    <caption>Personal Information</caption>
    <br>
    <label for="first-name">First Name:</label>
    <input id="first-name" type="text" />
    <button type="submit">Submit</button>
  </form>
  <a href="#">Rules</a>
</div>
</code>
</codeblock>
