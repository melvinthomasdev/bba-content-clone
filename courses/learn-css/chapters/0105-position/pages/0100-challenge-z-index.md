Use `z-index` values `3`, `2`
and
`1` to make the first image
appear on top of the second one
and
the second image on top of the third one:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img id="first" src="https://ucarecdn.com/55b63247-f656-40c6-bc5d-a21deb8ce149/" alt="Har ki Doon Valley Uttarakhand">
<img id="second" src="https://ucarecdn.com/64bbfc5d-0ecf-41ba-a724-85bd235b47c6/" alt="Aliyar Dam Pollachi">
<img id="third" src="https://ucarecdn.com/b0de0c9f-705d-41f8-8e4f-57266e93aaf8/" alt="Fort Kochi Beach">

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