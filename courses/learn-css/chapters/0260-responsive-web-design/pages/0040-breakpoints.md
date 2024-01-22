Let's look at a code example
that doesn't use media queries:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
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
<panel language="css">
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
</codeblock>

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