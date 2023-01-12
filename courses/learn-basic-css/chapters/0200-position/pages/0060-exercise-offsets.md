Set `position:relative` for the `label`
and
make it move away from the top by `15px`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<span class="label">Season</span>
<div class="card">
  <h1>Monsoon</h1>
  <p>
    A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
  </p>
</div>
</panel>
<panel language="css">
.label {
  display: inline-block;
  padding: 5px 10px;
  background-color: #0F766E;
  color: white;
}
.card {
  padding: 20px;
  background-color: #CCFBF1;
}
</panel>
</code>

<solution>
.label {
  display: inline-block;
  padding: 5px 10px;
  background-color: #0F766E;
  color: white;
  position: relative;
  top: 15px;
}
.card {
  padding: 20px;
  background-color: #CCFBF1;
}
</solution>
</codeblock>