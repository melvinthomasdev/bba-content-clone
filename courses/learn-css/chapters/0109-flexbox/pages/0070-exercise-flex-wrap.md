Use the `flex-wrap` property
on the container to wrap
the flex items:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <span>Engineer</span>
  <span>Artist</span>
  <span>Doctor</span>
  <span>Policeman</span>
  <span>Mechanic</span>
  <span>Astronaut</span>
  <span>Pilot</span>
  <span>Florist</span>
  <span>Lawyer</span>
  <span>Nurse</span>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
}
span {
  margin: 5px;
  padding: 8px 20px;
  background-color: tan;
  border-radius: 100px;
}
</panel>
</code>

<solution>
.container {
  display: flex;
  flex-wrap: wrap;
}
span {
  margin: 5px;
  padding: 8px 20px;
  background-color: tan;
  border-radius: 100px;
}
</solution>
</codeblock>