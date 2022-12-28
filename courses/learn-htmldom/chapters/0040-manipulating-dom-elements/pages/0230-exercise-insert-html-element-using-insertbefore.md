Use the `insertBefore` method to
insert an `li` element with the text
**Pacific Ocean** before the
last `li` element in the list.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<ul>
  <li>Indian Ocean</li>
  <li>Arctic Ocean</li>
  <li>Southern Ocean</li>
  <li>Atlantic Ocean</li>
</ul>
</panel>
<panel language="javascript">
let oceansList = document.querySelector('ul');
let lastOcean = document.querySelector('li:last-child');
</panel>
</code>

<solution>
let oceansList = document.querySelector('ul');
let lastOcean = document.querySelector('li:last-child');
let newOcean = document.createElement('li');
newOcean.textContent = "Pacific Ocean";
oceansList.insertBefore(newOcean, lastOcean);
</solution>
</codeblock>