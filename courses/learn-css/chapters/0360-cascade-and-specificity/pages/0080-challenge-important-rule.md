Add the `!important`
rule to `border-radius: 0`
within the `.special` selector
to make the first and last
images square:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="block">
  <img class="special" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/har-ki-doon-valley-uttarakhand_tJ6flaLSZ.jpg" alt="Har ki Doon Valley Uttarakhand">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/mumbai-01_qi4i8eg5J.jpg" alt="Mumbai">
  <img class="special" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/fort-kochi-beach_oxymW955x.jpg" alt="Fort Kochi Beach">
</div>
</panel>
<panel language="css">
.block img {
  width: 200px;
  height: 200px;
  border-radius: 100px;
}
.special {
  border-radius: 0;
}
</panel>
</code>

<solution>
.block img {
  width: 200px;
  height: 200px;
  border-radius: 100px;
}
.special {
  border-radius: 0 !important;
}
</solution>
</codeblock>
