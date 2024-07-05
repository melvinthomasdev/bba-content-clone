In HTML forms, there are two
common ways to create submission
buttons `<input type="submit">`
and
`<button type="submit">`.

Both type of buttons will
have the default behaviour
of submitting the form data
when they are clicked.

However, there are small
differences we need to be aware of.

Let us have a look at an example:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<!-- Input element of Type Submit -->
<form>
  <label>Company Name:</label>
  <br>
  <input type="text" placeholder="BigBinary">
  <br>

  <input type="submit">
</form>
<br>

<!-- Button element of Type Submit with text -->
<form>
  <label>Designation:</label>
  <br>
  <input type="text" placeholder="Software Engineer">
  <br>

  <button type="submit">Add Information</button>
</form>
<br>

<!-- Button element of Type Submit with HTML element -->
<form>
  <label>Name:</label>
  <br>
  <input type="text" placeholder="Sam Smith">
  <br>

  <button type="submit">
    <img src="https://ik.imagekit.io/d9mvewbju/tr:w-60,h-60/Course/BigbinaryAcademy/like_QjxRuLga9o.png">
  </button>
</form>
</code>
</codeblock>

As can be seen from the example,
we cannot add any content
in the input element because it
does not have a closing tag.

But, in the **button** element
with `type="submit"`,
we are free to add text,
images or even other HTML elements.
