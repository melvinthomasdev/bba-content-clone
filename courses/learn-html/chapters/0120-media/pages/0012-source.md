The `<source>` tag is used to specify
the available file sources, it is used in
`<picture>`, `<audio>` and `<video>`
tags as well.

Let's look at an example:

<codeblock language="html" type="lesson">
<code>
<picture>
  <img
  src="https://ucarecdn.com/8d92c6f9-2eae-4447-90c9-85eb59e2c8c7/"
  alt="a cat lying"
  width="300"
  height="200"
  loading="lazy"
  decoding="async">
  <source srcset="https://ucarecdn.com/1683b866-404c-42e1-90a2-08c5d1ce49bb/" type="image/avif">
  <source srcset="https://ucarecdn.com/8d92c6f9-2eae-4447-90c9-85eb59e2c8c7/" type="image/webp">
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
