You have `dog-image.jpg`, `dog-image-medium.jpg` and `dog-image-small.jpg`
available for use.

You can consider max width screen size for small as 480px and for medium as
768px.

So let's optimize the code below by using picture tag, so that the small and
medium sized images get loaded when the screen width changes.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
    <img src="dog-image.jpg" alt="A dog running" width="100%" >
</code>

<solution>
<picture>
  <source media="(max-width: 480px)" srcset="dog-image-small.jpg">
  <source media="(max-width: 768px)" srcset="dog-image-medium.jpg">
  <img src="dog-image.jpg" alt="A dog running" width="100%">
</picture>
</solution>
</codeblock>
