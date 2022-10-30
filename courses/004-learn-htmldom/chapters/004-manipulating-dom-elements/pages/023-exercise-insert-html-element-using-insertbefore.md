Use the `insertBefore` method to
insert an `li` element with the text
**Pacific Ocean** before the
last `li` element in the list.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<ul>
  <li>Indian Ocean</li>
  <li>Arctic Ocean</li>
  <li>Southern Ocean</li>
  <li>Atlantic Ocean</li>
</ul>
</panel>
<panel lang="javascript">
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
</Editor>