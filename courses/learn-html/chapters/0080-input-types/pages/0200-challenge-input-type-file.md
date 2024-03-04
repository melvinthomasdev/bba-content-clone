Create an input element
of type "file" within the
provided form.

This input should only
accept file type of
`application/pdf`.

The input field should
accept multiple files.
<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <!-- Write your code here -->
  <button>Submit</button>
</form>
</code>

<solution>
<form>
  <input type="file" accept="application/pdf" multiple>
  <button>Submit</button>
</form>
</solution>
</codeblock>
