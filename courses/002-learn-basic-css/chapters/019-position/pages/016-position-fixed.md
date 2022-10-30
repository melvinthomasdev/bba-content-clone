When you set an element's
`position` to `fixed`,
the element stays at the same position
even when you scroll away.

The `top`,
`right`, `bottom`,
and
`left` properties are
used to position the element relative to
the browser window itself:

<Editor lang="css">
<code>
<panel lang="html">
<div></div>
</panel>
<panel lang="css">
body {
  min-height: 120vh;
}
div {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: fixed;
  left: 0px;
  bottom: 0px;
}
</panel>
</code>
</Editor>

Change the position from `fixed`
to `absolute` and then scroll
again to notice the difference
between these two position values.

We can make any changes to the parent
element's position. It wouldn't affect
the child element which is now `fixed`:

<Editor lang="css">
<code>
<panel lang="html">
<div id="parent">
  <div id="fixed"></div>
</div>
</panel>
<panel lang="css">
body {
  min-height: 120vh;
}
#parent {
  background-color: teal;
  width: 200px;
  height: 100px;
}
#fixed {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: fixed;
  left: 0px;
  bottom: 0px;
}
</panel>
</code>
</Editor>

Like we said in the start,
a `fixed` element is positioned
in relation to the browser window.
But if you wanted to be more precise,
you'd say it is positioned relative to
the [window viewport](https://developer.mozilla.org/en-US/docs/Web/CSS/Viewport_concepts). It would be sensible for you to read a
bit more about it.