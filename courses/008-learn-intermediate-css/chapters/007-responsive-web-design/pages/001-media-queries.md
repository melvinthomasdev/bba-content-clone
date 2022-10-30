With CSS **flexbox**, we can create
blocks which automatically adjust
their sizes for small and large screens.
However, most of the times,
this isn't sufficient to create
a responsive layout.

Look at the example given below.
Go to the full screen mode using
the button on the top right side of
the code editor and resize the output
panel. Notice what happens when the
width is too small:

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

When the screen width gets small,
the columns shrink too much,
making the text hard to read.
Also, a horizontal scrollbar appears.
This is not desired behaviour.

We need a way to change
some styles based on the screen
size. This can be done
using **Media Queries**.
Let's look at the same example
using media queries:

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
@media screen and (max-width: 630px) {
  section {
    flex-direction: column;
  }
}
</panel>
</code>
</Editor>

Now, resize the output panel
and
notice what happens on smaller screens.
For screen widths larger than **630px**,
the blocks appear next to each other.
For screen widths smaller than **630px**,
the `flex-direction` gets changed to `column`.
This is why, the blocks get stacked
one below the other.