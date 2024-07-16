Remove underline from both the links,
make the text in the *Accept* link green in colour
and
the text in the *Decline* link should be red
in colour:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>You have received a gift</h2>
<a href="#" id="accept">
  Accept
</a>
<a href="#" id="decline">
  Decline
</a>
</panel>
<panel language="css">
a {
  margin-right: 20px;
  font-size: 1.2em;
}
</panel>
</code>

<solution>
a {
  margin-right: 20px;
  font-size: 1.2em;
  text-decoration: none;
}
#accept {
  color: green;
}
#decline {
  color: red;
}
</solution>
</codeblock>