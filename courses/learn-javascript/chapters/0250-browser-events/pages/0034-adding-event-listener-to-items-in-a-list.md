When we want to add event listeners
to items in a list, we need to select
list items and add event listener on
each item one by one.

Let us have a look at another example:
<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<ul class="item-list">
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
</panel>
<panel language="javascript">
const listItems = document.querySelectorAll("li");
listItems.forEach((item) => {
	item.addEventListener("click", () => {
		item.style.backgroundColor = "blue";
    item.style.color = "white";
	});
});
</panel>
</code>
</codeblock>

In the code above, we select
all the list items with the
class **list-item**.

After this step, we iterate
through each individual list item, 
and add a `click` event listener.
When the list item is clicked,
we change the background to
`blue` and font color to `white`.

