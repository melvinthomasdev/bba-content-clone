When length is specified using `vw`,
it is calculated based on the window width,
also known as viewport width.

`1vw` is `1%` of the window width.
So, `100vw` is equivalent to the window width.

<Editor lang="css">
<code>
<panel lang="html">
<div>
  Occupies 50% width of the window, with same height.
</div>
</panel>
<panel lang="css">
div {
  width: 50vw;
  height: 50vw;
  background-color: beige;
}
</panel>
</code>
</Editor>