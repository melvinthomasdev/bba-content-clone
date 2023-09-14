We must avoid placing a `<form>`
element inside another `<form>` element.

**Incorrect Form Structure:**
<codeblock language="html" type="lesson">
<code>
<form class="outer-form" action="/outer" method="post">
  <label for="outer-name">Outer Form Name:</label>
  <input type="text" id="outer-name" name="outer-name">

  <form class="inner-form" action="/inner" method="post">
    <label for="inner-name">Inner Form Name:</label>
    <input type="text" id="inner-name" name="inner-name">
  </form>

  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

**Correct Form Structure:**
<codeblock language="html" type="lesson">
<code>
<div class="outer-form">
  <form action="/outer" method="post">
    <label for="outer-name">Outer Form Name:</label>
    <input type="text" id="outer-name" name="outer-name">
    <button type="submit">Submit</button>
  </form>
</div>

<div class="inner-form">
  <form action="/inner" method="post">
    <label for="inner-name">Inner Form Name:</label>
    <input type="text" id="inner-name" name="inner-name">
    <button type="submit">Submit</button>
  </form>
</div>
</code>
</codeblock>
