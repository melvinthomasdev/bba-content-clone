Make these images display one below the other:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>Travel pictures:</p>
<img src="zanskar-river-ladakh.jpg" alt="Zanskar River Ladakh" />
<img src="parunthumpara-peermedu.jpg" alt="Parunthumpara Peermedu" />
<img src="munnar-kerala-05.jpg" alt="Munnar Kerala" />
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