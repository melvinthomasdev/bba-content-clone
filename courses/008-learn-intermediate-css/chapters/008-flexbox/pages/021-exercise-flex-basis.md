Set the initial width of
`.col1` to **40%** and
`.col2` to **60%** using the
`flex-basis` property:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div class="container">
  <div class="col1">
    <h2>Solar System</h2>
    <p>
      The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
    </p>
  </div>
  <div class="col2">
    <h2>The Sun</h2>
    <p>
      The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core.
    </p>
  </div>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
}
.col1, .col2 {
  margin: 10px;
  padding: 10px 30px;
  border: 1px solid lightgray;
}
</panel>
</code>

<solution>
.container {
  display: flex;
}
.col1, .col2 {
  margin: 10px;
  padding: 10px 30px;
  border: 1px solid lightgray;
}
.col1 {
  flex-basis: 40%;
}
.col2 {
  flex-basis: 60%;
}
</solution>
</Editor>