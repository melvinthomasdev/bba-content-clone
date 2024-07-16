A `<picture>` tag can be used to give
flexibility to developers for working
with images.

Let's look at an example:

<codeblock language="html" type="lesson">
<code>
<picture>
  <source media="(max-width: 550px)" srcset="https://upload.wikimedia.org/wikipedia/commons/4/41/Colibr%C3%AD_Cola_de_Oro_%28Golden-tailed_Sapphire_Hummingbird%29_Bigger_File.jpg">
  <source media="(max-width: 780px)" srcset="https://upload.wikimedia.org/wikipedia/commons/1/14/RubyThroatedHummingbird.jpg">
  <img src="https://upload.wikimedia.org/wikipedia/commons/f/fd/Canivet%27s_emerald.jpg" alt="picture of humming bird flying" width="100%">
</picture>
</code>
</codeblock>

In the above example, we have 3
different **bird** images. The first one
will be displayed when the the
available width is 0 pixels to 550 pixels.
The second image gets displayed when
the available width is 551 pixels to 780 pixels.

Depending
on the width of the screen, the image
with the best suited resolution
gets rendered.
