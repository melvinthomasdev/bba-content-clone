The `<input type="email">` defines
a field for an e-mail address.

This input value is automatically
validated to ensure that the
value entered is in email format:
`abc@abc.com`

Try clicking on the `Submit`
button in the form below.
<codeblock language="html" type="lesson">
<code>
<form>
  <label>Enter your email:</label>
  <input type="email" value="smith@example.com"><br>
  <label>Enter your alternate email:</label>
  <input type="email" value="hello world">
  <button>Submit</button><br>
</form>
</code>
</codeblock>

We see a warning related to the
alternate email. This is because,
the value we have entered for
the alternate email is not in
the email format.

Now to remove the warning,
you can replace `hello world`
with `sam@example.com` in the 
input field for alternate email
and then click `Submit`.
