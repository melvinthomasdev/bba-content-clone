When you have multiple CSS rules
that apply to the same HTML, these
rules conflict with each other
and
one of them wins:

<Editor lang="css">
<code>
<panel lang="html">
<p>
  CSS is Cascading Style Sheets, and the cascading is important.
</p>
</panel>
<panel lang="css">
p {
  color: orange;
  background-color: black;
}
p {
  color: blue;
  background-color: yellow;
}
p {
  color: green;
}
</panel>
</code>
</Editor>

In the above example, there
are three rules that try to
apply different colors to the
same `p` element, and two rules
that try to apply different
background colors.

In such a case,
where all the selectors are
identical, the rule that appears
last in the code always wins.
The last `color` value is **green**
and the last `background-color`
is **yellow**.

Try interchanging `orange`
and
`green` or try adding different
font sizes in multiple places
to see which styles apply.

Let's look at another similar
example:

<Editor lang="css">
<code>
<panel lang="html">
<p class="green orange">
  CSS is Cascading Style Sheets, and the cascading is important.
</p>
</panel>
<panel lang="css">
.orange {
  color: orange;
}
.green {
  color: green;
}
</panel>
</code>
</Editor>

Here, the selectors `.orange` and
`.green` are not
identical, but both are
**class selectors**.
This gives them equal importance.
Hence, the rule that comes last, wins.
At a very simple level, this
concept is called the `cascade`.