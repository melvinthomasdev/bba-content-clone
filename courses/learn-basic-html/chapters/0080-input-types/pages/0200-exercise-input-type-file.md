Create an input element
of type "file" within the
provided form.

This input should only
accept file type of
`application/pdf`.

The input field should
accept multiple files.
<codeblock language="html" type="exercise" testMode="fixedInput">
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
