The `<source>` tag is used to specify
the available file sources, it is used in
`<picture>`, `<audio>` and `<video>`
tags as well.

Let's look at an example:

<codeblock language="html" type="lesson">
<code>
<picture>
  <img
  src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/cat-image_UWjT0OwWf.jpg"
  alt="a cat lying"
  width="300"
  height="200"
  loading="lazy"
  decoding="async">
  <source srcset="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/cat-image_6-z1w9nxo.avif" type="image/avif">
  <source srcset="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/cat-image_UWjT0OwWf.jpg" type="image/webp">
</picture>
</code>
</codeblock>

New image formats like `avif` and
`webp` are not supported by old
browsers. Here
the browser renders the first
supported image file format it
encounters. Thus, having multiple source
files also ensures the older browsers
are also supported.
