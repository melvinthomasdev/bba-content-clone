Set the font family
as `'Times New Roman', serif`
and
make the font size `16px`
for the input fields:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<form>
  <h2>Sign In:</h2>
  <input type="email" placeholder="Email ID" />
  <input type="password" placeholder="Password" />
</form>
</panel>
<panel lang="css">
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
  font-family: 'Times New Roman', serif;
  font-size: 16px;
}
</solution>
</Editor>