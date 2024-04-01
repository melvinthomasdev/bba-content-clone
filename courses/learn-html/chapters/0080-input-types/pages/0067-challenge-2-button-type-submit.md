Add a submit button above
the closing tag of the form
element.

The button should display an
image with the following source:
`https://ucarecdn.com/8b4a9a74-3de8-46cb-b394-ad767f8b4d58/-/resize/150x100/`

<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Favourite Superhero:</label>
  <br>
  <input type="text" placeholder="Enter hero's name">
  <br>

  <!-- Write code below -->
</form>
</code>

<solution>
<form>
  <label>Favourite Superhero:</label>
  <br>
  <input type="text" placeholder="Enter hero's name">
  <br>

  <!-- Write code below -->
  <button type="submit">
    <img src="https://ucarecdn.com/8b4a9a74-3de8-46cb-b394-ad767f8b4d58/-/resize/150x100/">
  </button>
</form>
</solution>
</codeblock>
