When using the `<button>` element
inside a form always include the
`type` attribute to specify whether
it's a `submit`,
`reset` or a plain `button`.

<codeblock language="html" type="lesson">
<code>
<!-- Incorrect: Button without type attribute -->
<form>
  <button>Don't click me! 😥</button>
</form>

<!-- Correct: Button with type attribute -->
<form>
  <button type="button">Click me! 😁</button>
</form>
</code>
</codeblock>
