We must avoid placing a `<form>`
element inside another `<form>` element.

**Incorrect Form Structure:**
<codeblock language="html" type="lesson">
<code>
<form class="outer-form">
  <label for="outer-name">Outer Form Name:</label>
  <input type="text" id="outer-name">

  <form class="inner-form">
    <label for="inner-name">Inner Form Name:</label>
    <input type="text" id="inner-name">
  </form>

  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

**Correct Form Structure:**
<codeblock language="html" type="lesson">
<code>
<form class="outer-form">
  <label for="outer-name">Outer Form Name:</label>
  <input type="text" id="outer-name">
  <button type="submit">Submit</button>
</form>

<form class="inner-form">
  <label for="inner-name">Inner Form Name:</label>
  <input type="text" id="inner-name">
  <button type="submit">Submit</button>
</form>
</code>
</codeblock>
