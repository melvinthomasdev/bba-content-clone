Sometimes you might need to
override the styles of a more
specific selector. The only way
to do that is by adding
`!important` to the CSS rule,
to which you want to give more
importance:

<Editor lang="css">
<code>
<panel lang="html">
<p id="p1" class="para">
  !important overrides any specificity discussion.
</p>
</panel>
<panel lang="css">
#p1 {
  background-color: orange;
}
.para {
  background-color: gray !important;
}
</panel>
</code>
</Editor>

Though `#p1` is more specific
than `.para`, the background
color gray is applied because
of the `!important` rule. Try
removing `!important` to notice
the difference.

Note that, adding too many
`!important` rules in your code
will create confusion, because
you are overriding the normal
specificity.

Use this rule
only if it is absolutely
necessary.