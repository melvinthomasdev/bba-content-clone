With the `:first-child` pseudo-class,
you can select a particular type of
element if its the first
child of its parent. For example,
`span:first-child` selects a `span`
element, only if its the first
child of its parent. So, in the
following example, nothing is selected:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <p>This is a beginning paragraph</p>
  <span>Span 1</span>
  <span>Span 2</span>
  <span>Span 3</span>
  <p>This is an ending paragraph</p>
</div>
</panel>
<panel lang="css">
span {
  padding: 5px 8px;
  background-color: lightgray;
  border-radius: 3px;
}
span:first-child {
  background-color: orange;
}
</panel>
</code>
</Editor>

But if you want to select the
first `span` element within its
parent, whether or not it is the
first child, you can use `span:first-of-type`
instead:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <p>This is a beginning paragraph</p>
  <span>Span 1</span>
  <span>Span 2</span>
  <span>Span 3</span>
  <p>This is an ending paragraph</p>
</div>
</panel>
<panel lang="css">
span {
  padding: 5px 8px;
  background-color: lightgray;
  border-radius: 3px;
}
span:first-of-type {
  background-color: orange;
}
</panel>
</code>
</Editor>

`:last-child` and `:last-of-type` work in
the same manner.
Try using these two pseudo-classes
in place of `:first-of-type` to
understand how they work.