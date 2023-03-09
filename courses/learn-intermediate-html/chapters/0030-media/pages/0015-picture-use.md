A **picture** tag can be used when we have a scenario, where we want to display
a different image depending on certain conditions, such as:

**Screen width:** Similar to responsive webpage, we could load a smaller or
larger image depending on the screen width, there by improving performance and
faster page render.

<codeblock language="html" type="lesson">
<code>
<picture>
  <source media="(max-width: 550px)" srcset="https://upload.wikimedia.org/wikipedia/commons/3/3f/Cooper%27s_hawk_in_Prospect_Park_%2822513%29.jpg">
  <source media="(max-width: 780px)" srcset="https://upload.wikimedia.org/wikipedia/commons/1/17/Accipiter_nisus_edit.jpg">
  <img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/Chrysaetos_La_Ca%C3%B1ada_20120114_1.jpg" alt="Picture of Bird" width="100%">
</picture>
</code>
</codeblock>

**Art direction:** A different version of the image can be used for landscape
and portrait mode.

<codeblock language="html" type="lesson">
<code>
<picture>
    <source media="(max-width: 720px)" width="100%" srcset="https://upload.wikimedia.org/wikipedia/commons/c/c8/Taj_Mahal_in_March_2004.jpg" />
    <source media="(min-width: 721px)" width="100%" srcset="https://upload.wikimedia.org/wikipedia/commons/6/67/Taj_Mahal_in_India_-_Kristian_Bertel.jpg" />
    <img src="https://upload.wikimedia.org/wikipedia/commons/c/c8/Taj_Mahal_in_March_2004.jpg" width="100%" alt="Picture of Taj Mahal">
</picture>
</code>
</codeblock>

**Alternative image file format:** Some file formats are not supported by old
browsers, so we could provide image in multiple formats.

<codeblock language="html" type="lesson">
<code>
<picture>
  <img
  src="cat-image.jpg"
  alt="a cat lying"
  width="300"
  height="200"
  loading="lazy"
  decoding="async">
  <source srcset="cat-image.avif" type="image/avif">
  <source srcset="cat-image.webp" type="image/webp">
</picture>
</code>
</codeblock>
