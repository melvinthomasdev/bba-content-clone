Add the `content` **>** after the `a`
element and set a `margin-left` of **10px**:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time.Einstein is known for developing the theory of relativity, but he also made important contributions to the development of the theory of quantum mechanics.
</p>
<a href="#">Next</a>
</panel>
<panel lang="css">
a {
  text-decoration: none;
  padding: 8px 12px;
  color: gray;
  border: 1px solid lightgray;
  border-radius: 5px;
}
</panel>
</code>

<solution>
a {
  text-decoration: none;
  padding: 8px 12px;
  color: gray;
  border: 1px solid lightgray;
  border-radius: 5px;
}
a::after {
  content: ">";
  margin-left: 10px;
}
</solution>
</Editor>