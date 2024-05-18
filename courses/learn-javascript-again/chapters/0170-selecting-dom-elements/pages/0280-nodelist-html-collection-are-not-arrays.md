While **NodeList** and **HTMLCollection** share
similarities with arrays, there are important differences:
- Prototype Chain: They do not inherit from Array.prototype, so array methods are not directly available.
- Mutation Behavior: **NodeList** and **HTMLCollection** may be live, meaning they are automatically updated as the DOM changes.
- Accessing Elements: Elements in **NodeList** and **HTMLCollection** can be accessed by index like arrays but lack many array methods.

To utilize array methods like `forEach`, `map`,
and
`filter`, you need to convert **NodeList** and **HTMLCollection** into arrays.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class="items">
    <div>Item 1</div>
    <div>Item 2</div>
    <div>Item 3</div>
  </div>
  <div class="items">
    <div>Item 4</div>
    <div>Item 5</div>
    <div>Item 6</div>
  </div>
</panel>
<panel language="javascript">
const itemDivs = document.querySelectorAll('.items div');

// Convert NodeList to Array
const itemArray = Array.from(itemDivs);

// Now you can use array methods like forEach
itemArray.forEach(item => {
    console.log(item.textContent);
});
</panel>
</code>
</codeblock>
