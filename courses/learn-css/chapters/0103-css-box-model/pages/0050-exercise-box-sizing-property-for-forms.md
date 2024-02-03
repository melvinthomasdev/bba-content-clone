Set the `box-sizing` property for
the input elements in such a way
that they stay within the form width.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<form>
  <h2>Sign in</h2>
  <input type="email" id="email" placeholder="Email ID"><br>
  <input type="password" id="password" placeholder="Password">
</form>
</panel>
<panel language="css">
form {
  width: 300px;
  padding: 20px;
  background-color: beige;
}
#email, #password {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  background-color: white;
  border: solid 1px lightgray;
}
</panel>
</code>

<solution>
form {
  width: 300px;
  padding: 20px;
  background-color: beige;
}
#email, #password {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  background-color: white;
  border: solid 1px lightgray;
  box-sizing: border-box;
}
</solution>
</codeblock>