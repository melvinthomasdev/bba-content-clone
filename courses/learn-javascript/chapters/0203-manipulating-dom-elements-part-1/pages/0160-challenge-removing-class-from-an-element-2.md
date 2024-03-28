Remove the classes **company-border**
and
**company-card** from
the `div` element using the `classList`
property.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="company-border company-card">
  <h3>Shell Corporate Inc.</h3>
  <p>Legitimate Businesses for the common folk.</p>
</div>
</panel>
<panel language="css">
.company-border {
  border: 3px dashed gray;
  border-radius: 3px;
}

.company-card {
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  max-width: 300px;
  margin: 0 auto;
  text-align: center;
}
</panel>
<panel language="javascript">
let requiredDiv = document.querySelector('div');
</panel>
</code>

<solution>
let requiredDiv = document.querySelector('div');
requiredDiv.classList.remove('company-border', 'company-card');
</solution>
</codeblock>