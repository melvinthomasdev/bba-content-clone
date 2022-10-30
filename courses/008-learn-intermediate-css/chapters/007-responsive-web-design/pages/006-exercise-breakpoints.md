Using the mobile first approach,
set the width of this `div`
to **50%** for screens wider
than **600px** and **33%**
for screens wider than **900px**:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 200px;
  border: 2px solid purple;
}
</panel>
</code>

<solution>
div {
  height: 200px;
  border: 2px solid purple;
}
@media screen and (min-width: 600px) {
  div {
    width: 50%;
  }
}
@media screen and (min-width: 900px) {
  div {
    width: 33%;
  }
}
</solution>
</Editor>