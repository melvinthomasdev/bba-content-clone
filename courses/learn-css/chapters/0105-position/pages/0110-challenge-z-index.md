Use `z-index` values `3`, `2`
and
`1` to make the first image
appear on top of the second one
and
the second image on top of the third one:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img id="first" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/har-ki-doon-valley-uttarakhand_tJ6flaLSZ.jpg" alt="Har ki Doon Valley Uttarakhand">
<img id="second" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/aliyar-dam-pollachi_plFB33l2XF.jpg" alt="Aliyar Dam Pollachi">
<img id="third" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/fort-kochi-beach-square_TlUcZ6rQP.jpg" alt="Fort Kochi Beach">

</panel>
<panel language="css">
img {
  width: 100px;
  height: 100px;
  border: 8px solid white;
  border-radius: 50%;
  position: relative;
}
#first {

}
#second {
  left: -50px;
}
#third {
  left: -100px;
}
</panel>
</code>

<solution>
img {
  width: 100px;
  height: 100px;
  border: 8px solid white;
  border-radius: 50%;
  position: relative;
}
#first {
  z-index: 3;
}
#second {
  left: -50px;
  z-index: 2;
}
#third {
  left: -100px;
  z-index: 1;
}
</solution>
</codeblock>
