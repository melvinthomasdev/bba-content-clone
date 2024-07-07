Using JavaScript, select the
HTML element with the **id** - `image`
and
add the following classes to it:
- rounded-corner
- shadow

Display the updated list of
classes on the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" matchSolutionCode="true">
<code>
<panel language="html">
<div>
  <img id="image" class="rounded-corner" src="https://ik.imagekit.io/d9mvewbju/tr:w-400,h-350/Course/BigbinaryAcademy/new-york-city_5gBb-QRzNV.jpg">
</div>
</panel>
<panel language="css">
* {
  text-align: center;
}

.rounded-corner {
  border-radius: 10px;
}

.shadow {
  box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
}
</panel>
<panel language="javascript">
// Write code below
</panel>
</code>
<solution>
// Write code below
const image = document.getElementById("image");

image.classList.add("shadow");

console.log(image.classList);
</solution>
</codeblock>
