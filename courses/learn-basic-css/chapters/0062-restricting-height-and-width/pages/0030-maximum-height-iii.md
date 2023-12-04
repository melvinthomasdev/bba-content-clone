If the content is larger than the `max-height` value,
the excess content overflows, and the element's
`height` will be limited by the specified `max-height`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class=main>
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/66/Toronto_skyline_%282800881676%29.jpg" alt="Toronto skyline">
  <p>
    As the sun sets over Toronto, the skyline transforms into a captivating display of twinkling lights. The cityscape comes alive with a kaleidoscope of colors, illuminating the darkening horizon.
    <br>
    The CN Tower takes center stage, its spire gleaming like a beacon in the night sky. The tranquil waters of Lake Ontario mirror this enchanting spectacle, adding to the city's allure under the moonlit sky.
    <br>
    Amidst the radiant skyline, a sense of community thrives as residents and visitors gather along the waterfront, savoring the cool breeze and the warm glow of the city lights. As the evening deepens, the moon ascends higher in the sky, casting a silvery glow over the city. The CN Tower seems to reach for the heavens, its lights accentuating its iconic form against the night canvas. The sight is awe-inspiring, reminding everyone that even amidst the bustling city, there is still a tranquil and mystical side to be appreciated.
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
  max-height: 150px;
}
</panel>
</code>
</codeblock>

In this example, the paragraph content is now larger
than the `max-height` of `150px`. As a result, the excess
content will overflow. And the `p` element's `height` will
be limited by the specified `max-height`.
