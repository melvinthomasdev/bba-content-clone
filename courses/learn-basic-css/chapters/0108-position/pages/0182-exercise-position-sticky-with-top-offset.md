Add `position` property with
value as **sticky**
and
`top` property with value as
**20px** to the elements
with class `sticky-header`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="parent">
  <h3 class="sticky-header">List of rivers in India flowing into Arabian Sea</h3>
  <br>
  <ul class="river-list">
    <li>Narmada</li>
    <li>Tapi</li>
    <li>Sindhu</li>
    <li>Sabarmati</li>
    <li>Mahi</li>
    <li>Purna</li>
  </ul>
</div>
<div class="parent">
  <h3 class="sticky-header">List of rivers in India flowing into the Bay of Bengal</h3>
  <br>
  <ul class="river-list">
    <li>Brahmaputra
	  <li>Yamuna</li>
    <li>Ganga</li>
    <li>Meghna</li>
    <li>Mahanadi</li>
    <li>Godavari</li>
    <li>Krishna</li>
    <li>Kaveri</li>
    <li>Penna</li>
  </ul>
</div>
</panel>
<panel language="css">
body {
  height: 200vh;
  font-family: sans-serif;
}

.parent {
  border: 1px solid red;
  text-align: center;
  margin: 5px;
}
.river-list {
  list-style: none;
}
.river-list > li {
  padding: 5px;
  font-weight: bold;
}
.sticky-header {
  background-color: #1591fe;
  color: #fff;
  padding: 1em;
  text-align: center;
}
</panel>
</code>
<solution>
body {
  height: 200vh;
  font-family: sans-serif;
}

.parent {
  border: 1px solid red;
  text-align: center;
  margin: 5px;
}
.river-list {
  list-style: none;
}
.river-list > li {
  padding: 5px;
  font-weight: bold;
}
.sticky-header {
  background-color: #1591fe;
  color: #fff;
  padding: 1em;
  text-align: center;
  position: sticky;
  top: 20px;
}
</solution>
</codeblock>
