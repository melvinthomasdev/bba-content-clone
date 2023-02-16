When we specify the width of
an image in `pixels` or `em`,
on larger screens there might
be a lot of empty space next
to image and on smaller screens,
a horizontal scrollbar might appear.

The best approach to making the
images responsive, without the need
for media queries, is to set their
`max-width` as 100%. This makes the
image occupy full width of the screen
as long as the screen width is
smaller than the original image width.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<img src="mumbai-02.jpg">
</panel>
<panel language="css">
img {
  max-width: 100%
}
</panel>
</code>
</codeblock>

Try resizing the output panel
and
see how the image responds to
a change in the screen width.
The original width of the image
is 800px. When the screen width
is greater than 800px, the image
width does not increase further
because of the `max-width` property
set to 100%.