Given below is the
media query we used in
the previous example:

```
@media screen and (max-width: 630px) {
  ...
}
```

This is the CSS **@media rule**
which is used to apply different
styles for different device types or sizes.

## Media Type and Media Feature

This rule contains a **media type** `screen`
and
a **media feature** `max-width: 630px`.

Other media type values such as `all`,
`print` and `speech` can also be used.
A media feature expression
tests for a condition. The styles within
the media query are applied
if this condition is true.

In our previous example, for a `max-width`
of **630px** screen, the flex direction
**column** is applied. For screen sizes
greater than **630px**, the condition is
false. Hence the styles are not applied.
Let's look at another example:

<Editor lang="css">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 200px;
  background-color: green;
}
@media screen and (max-width: 600px) {
  div {
    background-color: orange;
  }
}
</panel>
</code>
</Editor>

Now try changing `max-width` to
`min-width`. You will see
**green** on a smaller screen and
**orange** on a larger screen.

We can also combine two
or more media features
using `and`, `or`, `not` keywords:

<Editor lang="css">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 200px;
  background-color: green;
}
@media screen and (min-width: 401px) and (max-width: 800px) {
  div {
    background-color: orange;
  }
}
@media screen and (max-width: 400px) {
  div {
    background-color: red;
  }
}
</panel>
</code>
</Editor>

Now, you will see
**red** on a very small screen,
**orange** on slightly larger screens
and **green** on much larger screens.

Each **media feature**
expression must be surrounded
by parenthesis.
