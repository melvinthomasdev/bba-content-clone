Select all the list elements in the
unordered list and store them in
the `shoppingItems` variable.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<ul>
  <li>Oil</li>
  <li>Milk</li>
  <li>Pineapple</li>
  <li>Shoes</li>
  <li>Soap</li>
</ul>
</panel>
<panel language="javascript">
let shoppingList = document.querySelector("ul");
let shoppingItems = ;
for (let item of shoppingItems) {
  console.log(item.textContent);
}
</panel>
</code>

<solution>
let shoppingList = document.querySelector("ul");
let shoppingItems = shoppingList.children;
for (let item of shoppingItems) {
  console.log(item.textContent);
}
</solution>
</codeblock>