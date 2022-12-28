Add the `!important`
rule to `border-radius: 0`
within the `.special` selector
to make the first and last
images square:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="block">
  <img class="special" src="har-ki-doon-valley-uttarakhand.jpg" alt="Har ki Doon Valley Uttarakhand"/>
  <img src="mumbai-01.jpg" alt="Mumbai"/>
  <img class="special" src="fort-kochi-beach.jpg" alt="Fort Kochi Beach"/>
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