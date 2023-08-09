If the content inside the element is larger
than the value of min-height, the `min-height`
property has no effect, and the element's `height`
expands based on its content.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class=main>
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/66/Toronto_skyline_%282800881676%29.jpg" alt="Toronto skyline">
  <p>
    As the sun sets over Toronto, the skyline transforms into a captivating display of twinkling lights. The cityscape comes alive with a kaleidoscope of colors, illuminating the darkening horizon.

    The CN Tower takes center stage, its spire gleaming like a beacon in the night sky. The tranquil waters of Lake Ontario mirror this enchanting spectacle, adding to the city's allure under the moonlit sky.
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

In the above example, the paragraph content is
larger than the `min-height`, which is set to `150px`.
In this case, the `p` element will expand its
`height` to fit the content adequately.
