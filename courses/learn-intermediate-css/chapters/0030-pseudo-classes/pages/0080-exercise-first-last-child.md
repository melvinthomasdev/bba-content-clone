Set `margin-right` as `0` for the last
image element to make all the
images appear next to each other:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <img src="https://ucarecdn.com/55b63247-f656-40c6-bc5d-a21deb8ce149/" alt="Har ki Doon Valley Uttarakhand">
  <img src="https://ucarecdn.com/27b7a163-1169-4436-bb88-d11b7b08680b/" alt="Mumbai">
  <img src="https://ucarecdn.com/239a6179-8e6a-4aca-ac0a-aa93e6881d1e/" alt="Fort Kochi Beach">
</div>
</panel>
<panel language="css">
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
</codeblock>