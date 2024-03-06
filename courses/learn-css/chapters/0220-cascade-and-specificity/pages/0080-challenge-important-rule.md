Add the `!important`
rule to `border-radius: 0`
within the `.special` selector
to make the first and last
images square:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="block">
  <img class="special" src="https://ucarecdn.com/55b63247-f656-40c6-bc5d-a21deb8ce149/" alt="Har ki Doon Valley Uttarakhand">
  <img src="https://ucarecdn.com/27b7a163-1169-4436-bb88-d11b7b08680b/" alt="Mumbai">
  <img class="special" src="https://ucarecdn.com/239a6179-8e6a-4aca-ac0a-aa93e6881d1e/" alt="Fort Kochi Beach">
</div>
</panel>
<panel language="css">
.block img {
  width: 200px;
  height: 200px;
  border-radius: 100px;
}
.special {
  border-radius: 0;
}
</panel>
</code>

<solution>
.block img {
  width: 200px;
  height: 200px;
  border-radius: 100px;
}
.special {
  border-radius: 0 !important;
}
</solution>
</codeblock>