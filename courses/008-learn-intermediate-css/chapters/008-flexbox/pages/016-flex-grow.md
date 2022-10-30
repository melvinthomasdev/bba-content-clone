Look at this example:

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <p class="p1">Sun</p>
  <p class="p2">The Sun is the star at the center of the Solar System.</p>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
p {
  background-color: #f1f1f8;
  padding: 10px;
  border: 1px solid #a1a1a1;
}
</panel>
</code>
</Editor>

Even though there's space
on the right, the items only
occupy as much space as needed.
Sometimes, you might want
one or all of the items to
occupy the full space
available. That's when you can
use the `flex-grow` property
on individual flex items to
specify a number.

The default value is **0**,
which is why the items occupy
only as much space as required.
When the value is more than **0**
for some items, the extra space
is divided proportionally among those items:

<Editor lang="css">
<code>
<panel lang="html">
<div class="container">
  <p class="p1">Sun</p>
  <p class="p2">The Sun is the star at the center of the Solar System.</p>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
p {
  background-color: #f1f1f8;
  padding: 10px;
  border: 1px solid #a1a1a1;
}
.p1 {
  flex-grow: 1;
}
.p2 {
  flex-grow: 2;
}
</panel>
</code>
</Editor>

Resize the output panel to
see how the widths change.
See what happens when we change the
`flex-grow` value of `.p1` to
**0**.

Then change the `flex-grow` value of
`.p2` to **0**
and
`.p1` back to **1**. Now, observe
what happens when you
resize the output panel.