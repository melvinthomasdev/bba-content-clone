The `<input type="file">` element
defines a file-select field
along with a "Browse" button.

This element lets the user
choose files from their
device's storage.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <input type="file" accept="image/png, image/jpeg" placeholder="image.png/image.jpeg" multiple><br>
  <button>Submit</button>
</form>
</code>
</codeblock>

Inputs of type `file` also support
the following attributes:

- The `accept` attribute is
a string that defines the file
types this input should accept.

- To define a file-select field
that allows multiple files to
be selected, add the `multiple`
attribute.
