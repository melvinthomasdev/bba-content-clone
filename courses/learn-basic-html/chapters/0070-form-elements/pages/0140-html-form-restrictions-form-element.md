Take a look at the following example.
It is a wrong way to add a `<form>`
element to your code:
<codeblock language="html" type="lesson">
<code>
<form>
  <label>First Name:</label>
  <br>
  <input type="text" placeholder="Sam" >
</form>
<form>
  <label>Last Name:</label>
  <br>
  <input type="text" placeholder="Smith" >
</form>
<form>
  <label>Email:</label>
  <br>
  <input type="text" placeholder="sam.smith@example.com" >
</form>
<form>
  <label>Password:</label>
  <br>
  <input type="text">
</form>
<button>Submit</button>
</code>
</codeblock>

We should avoid using multiple form
tags like this.
Instead, group all the elements that
belong to a single form inside one
`form` element.

Check the example below of
a **correct form structure**:
<codeblock language="html" type="lesson">
<form>
  <label>First Name:</label>
  <br>
  <input type="text" placeholder="Sam" >
  <br>

  <label>Last Name:</label>
  <br>
  <input type="text" placeholder="Smith" >
  <br>

  <label>Email:</label>
  <br>
  <input type="text" placeholder="sam.smith@example.com" >
  <br>

  <label>Password:</label>
  <br>
  <input type="text">
  <br>

  <button>Submit</button>
</form>
</code>
</codeblock>