Make these images display one below the other:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>Travel pictures:</p>
<img src="https://ucarecdn.com/2b2cbeb7-8d93-467e-8b53-022b51071c6e/" alt="Zanskar River Ladakh">
<img src="https://ucarecdn.com/152a39aa-29fa-4cb9-bfc0-001b5a89ab3d/" alt="Parunthumpara Peermedu">
<img src="https://ucarecdn.com/95bf9e35-7bfc-4212-b25f-ed253bc3040b/" alt="Munnar Kerala">
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