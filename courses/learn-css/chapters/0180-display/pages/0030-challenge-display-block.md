Make these images display one below the other:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>Travel pictures:</p>
<img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/zanskar-river-ladakh_Y-rL9FsDb.jpg" alt="Zanskar River Ladakh">
<img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/parunthumpara-peermedu_4-ad3Kb2Sf.jpg" alt="Parunthumpara Peermedu">
<img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/munnar-kerala-05_2z-L_seh8.jpg" alt="Munnar Kerala">
</panel>
<panel language="css">
img {
  margin-top: 20px;
  width: 200px;
}
</panel>
</code>

<solution>
img {
  margin-top: 20px;
  width: 200px;
  display: block;
}
</solution>
</codeblock>
