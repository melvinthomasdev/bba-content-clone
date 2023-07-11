The `<input type="file">` element
defines a file-select field
along with a "Browse" button.

This element lets the user
choose files from their
device's storage.

<codeblock language="html" type="lesson">
<code>
<form>
  <input type="file" accept="image/png, image/jpeg" multiple><br>
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