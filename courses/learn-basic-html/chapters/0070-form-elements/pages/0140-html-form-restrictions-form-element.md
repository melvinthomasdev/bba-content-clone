Take a look at the following example.
It is a wrong way to add a `<form>`
element to your code:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>First Name:</label>
  <br>
  <input placeholder="Sam" >
</form>
<form>
  <label>Last Name:</label>
  <br>
  <input placeholder="Smith" >
</form>
<form>
  <label>Email:</label>
  <br>
  <input placeholder="sam.smith@example.com" >
</form>
<form>
  <label>Password:</label>
  <br>
  <input>
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
<panel language="html" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<form>
  <label>First Name:</label>
  <br>
  <input placeholder="Sam" >
  <br>

  <label>Last Name:</label>
  <br>
  <input placeholder="Smith" >
  <br>

  <label>Email:</label>
  <br>
  <input placeholder="sam.smith@example.com" >
  <br>

  <label>Password:</label>
  <br>
  <input>
  <br>

  <button>Submit</button>
</form>
</code>
</codeblock>
