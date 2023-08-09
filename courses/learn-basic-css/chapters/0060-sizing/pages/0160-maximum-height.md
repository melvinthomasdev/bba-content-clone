The `max-height` property in CSS is used to set
the maximum height of an element, allowing us to
restrict how tall the element can grow.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class=main>
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/66/Toronto_skyline_%282800881676%29.jpg" alt="Toronto skyline">
  <p>
    As the sun sets over Toronto, the skyline transforms into a captivating display of twinkling lights. The cityscape comes alive with a kaleidoscope of colors, illuminating the darkening horizon.
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

In the above example, we have applied the `max-height`
property to the `p` element. This way, we can control its height.
