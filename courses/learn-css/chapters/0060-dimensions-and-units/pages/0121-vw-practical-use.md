The `vw` unit is useful when we want to
define width of elements based on the screen
width.

Take a look at the following example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="hero-section">
    <div class="hero-text">
        <h1>Build Something New</h1>
        <p>Discover life's challenges every day</p>
    </div>
</div>
</panel>
<panel language="css">

.hero-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 5vw;
    text-align: center;
}
</panel>
</code>
</codeblock>

`vw` is used here for the font-size
because we want the text size to change
proportionally with the change in the width
of the viewport.

Open this code in a new NeetoCode and
drag to change the width. You'll see that
the size of the text increases properly
with the change in the width of the viewport.