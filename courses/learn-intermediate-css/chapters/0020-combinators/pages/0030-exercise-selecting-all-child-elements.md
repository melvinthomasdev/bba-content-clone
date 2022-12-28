Add a `font-size` of
**0.9em** and a **darkgray**
text colour to
the paragraph within
a `div` which has the id, `note`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Pluto</h2>
<p>
  Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It was the first and the largest Kuiper belt object to be discovered.
</p>
<div id="note">
  <p>
    PS: After Pluto was discovered in 1930, it was declared to be the ninth planet from the Sun.
  </p>
</div>
</panel>
<panel language="css">

</panel>
</code>

<solution>
#note p{
  font-size: 0.9em;
  color: darkgray;
}
</solution>
</codeblock>