Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <h1 id="child"> Relative unit 'em' </h1>
</div>
</panel>
<panel language="css">
#parent {
  font-size: 20px;
}
#child {
  font-size: 1em;
  /*
  font-size = 1 em = 1*20px = 20px
  */
  width: 5em;
  height: 5em;
  /*
  width & height = 5em = 5*font-size = 5*20px = 100px
  */
  background-color: peachpuff;
}
</panel>
</code>
</codeblock>

In the above example, the width and
height of `h1` were calculated based
on `h1`'s font size.
Though one thing different here is that,
the `font-size` itself is given in `em`.
So the `font-size` value of `h1`
now depends on the font size of its parent element.

When we don't set a font size on
a parent element or any of its ancestors,
the **default font size**
of the browser will be used.
In most web browsers, the default font size
is **16px**, unless the default browser settings
are changed.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <div id="child">
    Relative unit 'em'
  </div>
</div>
</panel>
<panel language="css">
#child {
  font-size: 1em;
  width: 10em;
  height: 10em;
  /* width & height = 10em = 10*font-size = 10*16px = 160px */
  background-color: orange;
}
</panel>
</code>
</codeblock>

In the above example, since the parent element
doesn't have a specified font size, it will
inherit the default font size from the browser.
So, the width and height of the child element are
calculated based on the `div`'s `font-size`.
