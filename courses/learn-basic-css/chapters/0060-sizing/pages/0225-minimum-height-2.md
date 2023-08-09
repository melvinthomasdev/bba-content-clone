If the content is smaller than the `min-height` value,
the element's `height` will be adjusted to meet the
minimum `height` specified.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class=main>
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/66/Toronto_skyline_%282800881676%29.jpg" alt="Toronto skyline">
  <p>
    As the sun sets over Toronto, the skyline transforms into a captivating display of twinkling lights.
  </p>
</div>
</panel>
<panel language="css">
.main {
  margin: 20px auto;
  width: 600px;
}
img {
  height: 300px;
  width: 600px;
}
p {
  width: 550px;
  border: 5px solid red;
  padding: 20px;
  margin-top: 20px;
  min-height: 150px;
}
</panel>
</code>
</codeblock>

In this example, the paragraph content is now smaller
than the `min-height` of `150px`. But, the `p` element's height
will remain `150px`, which is the minimum specified height.
