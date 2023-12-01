When using the `<button>` element
inside a form always include the
`type` attribute to specify whether
it's a `submit`,
`reset` or a plain `button`.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <!-- Incorrect: Button without type attribute -->
  <button>Don't click me! 😥</button>

  <!-- Correct: Button with type attribute -->
  <button type="button">Click me! 😁</button>
</form>
</code>
</codeblock>
