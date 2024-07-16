You have

- `https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image_l06ws4elG.jpg`
- `https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image-medium_mAHldRLs4.jpg` (medium)
- `https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image-small_F57Tr80pW.jpg` (small)

available for use.

You can consider max width screen size for small as 480px and for medium as
768px.

So let's optimize the code below by using picture tag, so that the small and
medium sized images get loaded when the screen width changes.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
    <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image_l06ws4elG.jpg" alt="A dog running" width="100%" >
</code>

<solution>
<picture>
  <source media="(max-width: 480px)" srcset="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image-small_F57Tr80pW.jpg">
  <source media="(max-width: 768px)" srcset="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image-medium_mAHldRLs4.jpg">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/dog-image_l06ws4elG.jpg" alt="A dog running" width="100%">
</picture>
</solution>
</codeblock>
