The `float` property has been
used a lot in the past to create
web layouts. We can agree that
it helps us stack elements
next to each other. But, there are
so many limitations with `float`.
Not only that, our code
gets complex for large layouts too.
There have to be better ways to
create layouts in CSS.

Let's look
at a simple example:

<Editor lang="css">
<code>
<panel lang="html">
<section>
  <div class="col">
    <h2>Solar System</h2>
    <p>
      The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
    </p>
  </div>
  <div class="col">
    <h2>The Sun</h2>
    <p>
      The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core.
    </p>
  </div>
  <div class="col">
    <h2>Earth</h2>
    <p>
      Earth is the third planet from the Sun and the only astronomical object known to harbor and support life. About 29.2% of Earth's surface is land consisting of continents and islands.
    </p>
  </div>
</section>
</panel>
<panel lang="css">
section {
  display: flex;
}
.col {
  margin: 10px;
  padding: 5px 15px;
  background-color: #F1F5F9;
}
</panel>
</code>
</Editor>

By setting the `display` property
of the section element to `flex`,
the child elements automatically
get placed next to each other.

You can see that the heights of all the 3
blocks are the same. The widths of
these blocks are proportional to
the content within.

Try adding another sentence to the
first `div` and see how the width
changes. These blocks have **flexible**
dimensions which is where the name of this
property **flexbox** comes from.