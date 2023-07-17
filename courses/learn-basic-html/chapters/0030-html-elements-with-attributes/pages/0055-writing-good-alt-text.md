A **good** **`alt`** text provides a concise and descriptive summary
of the image, by conveying relevant details and context. While,
a `alt` text is considered **bad** if it lacks information, duplicates
existing text, or provide inaccurate or unrelated descriptions.

In case of **decorative images** the alt text should be **empty**, as these
images don't add any information to the content of a page and therefore
should be ignored by screen readers.

Examples of decorative images:

1. Images that act as corners, spacers, and borders.
2. Images that are placed next to text, to serve as **ambience**.

Writing phrases like **image of** or **photo of** in alt text is not needed,
as screen readers announce the type of content before reading the alt text.

Let's look at some examples of good and bad **alt text**:

<codeblock language="html" type="lesson">
<code>
<!--Image 1-->
<img src="https://upload.wikimedia.org/wikipedia/commons/3/3d/Cal%C3%ADope.jpg" width="10%">
<!--
Good
  alt="A black and white kitten"
Bad
  alt="Cat"
-->
<!--Above example with a no image link and alt text added-->
<img src="#" width="10%" alt="A black and white kitten">
<br>

<!--Image 2-->
<img src="https://upload.wikimedia.org/wikipedia/commons/7/7d/Apollo_11_Saturn_V_lifting_off_on_July_16%2C_1969.jpg" width="10%">
<!--
Good
  alt="Apollo 11 Saturn V space vehicle lifting off from Cape Kennedy on July 16, 1969"
Bad
  alt="Photo of a Rocket"
-->
<!--Above example with a no image link and alt text added-->
<img src="#" width="10%" alt="Apollo 11 Saturn V space vehicle lifting off from Cape Kennedy on July 16, 1969">
<br>

<!--Image 3-->
<img src="https://ucarecdn.com/ef793589-6678-4b55-b0b3-8346dfcfea44/" width="10%">
<!--
Good
  alt="Page not found"
Bad
  alt="404"
-->
<!--Above example with a no image link and alt text added-->
<img src="#"  alt="https://ucarecdn.com/ef793589-6678-4b55-b0b3-8346dfcfea44/" width="10%">
</code>
</codeblock>
