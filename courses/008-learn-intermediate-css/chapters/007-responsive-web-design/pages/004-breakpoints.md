Let's look at a code example
that doesn't use media queries:

<Editor lang="css">
<code>
<panel lang="html">
<section>
  <div id="col1" class="col">
    <h2>Solar System</h2>
    <p>
      The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets, with the remainder being smaller objects, the dwarf planets and small Solar System bodies. Of the objects that orbit the Sun indirectly—the natural satellites—two are larger than the smallest planet, Mercury.
    </p>
  </div>
  <div id="col2" class="col">
    <h2>Inner Planets</h2>
    <ul>
      <li>Mercury</li>
      <li>Venus</li>
      <li>Earth</li>
      <li>Mars</li>
    </ul>
  </div>
  <div id="col3" class="col">
    <h2>Outer Planets</h2>
    <ul>
      <li>Jupiter</li>
      <li>Saturn</li>
      <li>Uranus</li>
      <li>Neptune</li>
    </ul>
  </div>
</section>
</panel>
<panel lang="css">
section {
  display: flex;
  flex-wrap: wrap;
}
#col1 {
  flex: 2;
}
#col2, #col3 {
  flex: 1;
}
.col {
  margin: 10px;
  padding: 5px 15px;
  background-color: #F1F5F9;
}
ul {
  margin-left: -25px;
}
</panel>
</code>
</Editor>

This layout looks good on large screens.
When we resize the output panel to have
a smaller width, at one point we begin
to feel that the columns shrink too much.
At that point, you would like to add a
media query to change the styles:

So add this media query in the
editor given above and see what happens:

```
@media screen and (max-width: 860px) {
  #col1 {
    flex: 100%;
  }
}
```

Below the screen width of **860px**,
the `flex-basis` value of **col1** is set
to **100%** using the shorthand `flex` property.
This makes the 2nd and 3rd column shift down
together. This looks good until you reach a
much smaller screen width. Then you would like
to add another media query to make the 2nd
and
3rd column stretch full width each.
So, add this media query:

```
@media screen and (max-width:420px) {
  #col2, #col3 {
    flex: 100%;
  }
}
```

Now, we have a
fully responsive layout.

The points **860px**
and
**420px** at which we introduced
media queries are **breakpoints**.

The best way to choose breakpoints
is by selecting the screen widths
where your content starts to break
in some way.

<!--
In the code, `@media screen and (max-width: 600px)`,
**600px** is known
as a **breakpoint**. You can
add as many breakpoints
as you wish:

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
@media screen and (max-width: 400px) {
  div {
    background-color: yellow;
  }
}
</panel>
</code>
</Editor>

Click on the maximize code editor
button on the top right side of the
editor.

Now, try changing the size of
the output panel by dragging the
sides.

When you make it to be a size less than
**400px**, you'll see that the background colour
changes to **yellow**.

On the other hand, when the screen size is
dragged to be made larger than **400px** but
smaller than **600px**, the background colour
becomes **orange**.

In this case, the order of
appearance of media rules is
very important. If you place the
`max-width: 600px` media rule
after `max-width: 400px`,
then you will never see yellow
because now the condition of
`max-width: 600px` overrides
the previous condition.

Try reversing the two to
check for yourself.

In the above example, we set
green color for larger screens
and
as we go smaller, we change the color.
However, we can achieve the same
output starting from smaller
screens and changing the
styles as the screen size
increases, by using the `min-width`
condition instead of `max-width`:

<Editor lang="css">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 200px;
  background-color: yellow;
}
@media screen and (min-width: 400px) {
  div {
    background-color: orange;
  }
}
@media screen and (min-width: 600px) {
  div {
    background-color: green;
  }
}
</panel>
</code>
</Editor>te that the output is same,
but the approach is different.
This approach is known as
**mobile first approach**, where
you set styles for mobile
screen sizes first and then
make changes for larger screens.
This is the recommended
approach for best performance.

Also notice that while using
`min-width`, the media query
with **400px** has to be
specified before **600px**
for it to work correctly.

So, for 'desktop first approach',
start with the largest breakpoint.
And for 'mobile first approach',
start with the smallest breakpoint.
-->
