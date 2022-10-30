In the previous examples, we started
with layouts suitable for desktops.
Then we worked our way towards smaller
screen sizes by adding breakpoints to
change the styles for widths lower than
that of the breakpoint. This approach is
known as the **Desktop First** approach.

On the other hand, you can start with a
layout suitable for the mobile screens.
Usually, this would be a simpler design
choice:

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
</Editor>First, resize the output panel to a
smaller width and then start increasing
the width. At **420px**, let's introduce
a media query to stack **col2**
and
**col3** next to each other.
Paste this in the editor provided above:

```
@media screen and (min-width: 420px) {
  section {
    display: flex;
    flex-wrap: wrap;
  }
  #col1 {
    flex: 100%;
  }
  #col2, #col3 {
    flex: 1;
  }
}
```

Then, for screen sizes larger
than **860px**, let's change
the styles again by adding this:

```
@media screen and (min-width: 860px) {
  #col1 {
    flex: 2;
  }
}
```

This approach known as the **Mobile First**
approach is the recommended one.

Keep in mind that we used `max-width`
media feature for desktop-first
approach and `min-width` for mobile-first approach.