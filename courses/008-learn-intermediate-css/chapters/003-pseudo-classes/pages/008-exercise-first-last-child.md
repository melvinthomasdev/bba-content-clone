Set `margin-right` as `0` for the last
image element to make all the
images appear next to each other:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
  <img src="har-ki-doon-valley-uttarakhand.jpg" alt="Har ki Doon Valley Uttarakhand"/>
  <img src="mumbai-01.jpg" alt="Mumbai"/>
  <img src="fort-kochi-beach.jpg" alt="Fort Kochi Beach"/>
</div>
</panel>
<panel lang="css">
div {
  min-height: 300px;
}

img {
  float: left;
  width: 32%;
  margin-right: 2%;
}
</panel>
</code>

<solution>
div {
  min-height: 300px;
}
img {
  float: left;
  width: 32%;
  margin-right: 2%;
}
img:last-child {
  margin-right: 0;
}
</solution>
</Editor>