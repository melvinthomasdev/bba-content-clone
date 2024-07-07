Change the code given below,
so that whenever someone copies
a list item,
the `innerText` of that list
item gets logged to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<ul class="item-list">
  <li>Item 1: Apple</li>
  <li>Item 2: Orange</li>
  <li>Item 3: Strawberry</li>
</ul>
</panel>
<panel language="javascript">
// Write code below
</panel>
</code>
<solution>
const listItems = document.querySelectorAll("li");

listItems.forEach(item => {
  item.addEventListener("copy", () => {
    console.log(item.innerText);
  });
});
</solution>
</codeblock>
