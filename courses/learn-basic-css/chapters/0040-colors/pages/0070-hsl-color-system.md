In the HSL color system, colors
are represented by three values:
Hue, Saturation, and Lightness.

<image>hsl-color-wheel.png</image>

Hue: This refers to the color
itself and is measured in degrees
on a circular color wheel as
we can see in the above image.

This starts at red (0°) and
goes through orange, yellow,
green, blue, and magenta, ending
back at red (360°).

Saturation: When we look at colors,
some of them are really bright and strong,
while others are more muted or dull.

The brightness and strength of a color is
called its "saturation."

Saturation is measured as a percentage,
which is a way of showing how pure/strong
is the color.

Lightness: This refers to the
brightness of the color and is
also measured as a percentage.
A lightness of 0% represents black,
while 100% represents white.

Let's take a look at an example
to understand better:

<codeblock type="lesson" language="css">
<code>
<panel language="html">
<p class="purple">I am purple.</p>
<p class="blue">I am blue.</p>
<p class="green">I am green.</p>
</panel>
<panel  language="css">
.purple {
  color: hsl(300, 100%, 25%);
}
.blue {
  color: hsl(210, 45%, 20%);
}
.green {
  color: hsl(150, 50%, 70%);
}
</panel>
</code>
</codeblock>
