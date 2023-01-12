Add a `solid` border of `1px` width
and
`#d0d4d9` colour along with a
border radius of `5px`
to the text input fields.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<form>
  <h2>Sign In:</h2>
  <input type="email" placeholder="Email ID" />
  <input type="password" placeholder="Password" />
</form>
</panel>
<panel language="css">
input[type="email"], input[type="password"] {
  width: 300px;
  padding: 10px;
  margin-bottom: 10px;
}
</panel>
</code>

<solution>
input[type="email"], input[type="password"] {
  width: 300px;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #d0d4d9;
  border-radius: 5px;
}
</solution>
</codeblock>