Set `margin-right` as `0` for the last
image element to make all the
images appear next to each other:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/har-ki-doon-valley-uttarakhand_tJ6flaLSZ.jpg" alt="Har ki Doon Valley Uttarakhand">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/mumbai-01_qi4i8eg5J.jpg" alt="Mumbai">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/fort-kochi-beach_oxymW955x.jpg" alt="Fort Kochi Beach">
</div>
</panel>
<panel language="css">
div {
  min-height: 300px;
}

img {
  float: left;
  width: 32%;
  margin-right: 2%;
}
</panel>
</code>

<solution>
div {
  min-height: 300px;
}
img {
  float: left;
  width: 32%;
  margin-right: 2%;
}
img:last-child {
  margin-right: 0;
}
</solution>
</codeblock>
