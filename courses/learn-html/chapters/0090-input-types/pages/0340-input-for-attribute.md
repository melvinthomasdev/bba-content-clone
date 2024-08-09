The label element has a `for`
attribute which lets us bind this
attribute to the particular form
element that it references.

Take a look:

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label for="username">Full Name:</label>
  <input type="text" id="username">
  <br>
  <label for="color-choice">Favourite Colour:</label>
  <input type="color" id="color-choice">
  <br>
  <button>Submit</button>
</form>
</code>
</codeblock>

The `for` attribute value should be
the same as the value for the `id` of
the form input element. This way, the
label element is now bound to this particular
form element.

If you click on the label text,
you'll see that the particular
form element will be highlighted. Try
it! Click on the label `Full Name:` in
the preview and see what happens.