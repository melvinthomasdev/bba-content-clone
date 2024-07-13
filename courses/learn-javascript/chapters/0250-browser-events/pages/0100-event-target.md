Every object in our DOM can
trigger an event. The object that
triggers our particular event
is called the **target**:
<!-- TODO: talk about how target is imp as in the case of event delegation -->
<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>This p element is where we are listening for a hover event.</p>
</panel>
<panel language="javascript">
let pElement = document.querySelector('p');
pElement.addEventListener("mouseover", (event) => {
    event.target.style.color = "orangered";
});
pElement.addEventListener("mouseout", (event) => {
    event.target.style.color = "black";
});
</panel>
</code>
</codeblock>

In the example given above, the `p` element
is the target for both `mouseover` and
`mouseout` events. We listen to these
events on the `p` element and change
the color of the text depending on
which event was triggered.

The `event` parameter that we see in
our `addEventListener` is an `event` object.
It is automatically passed to all event
handlers. It helps in passing extra information like
the `target` to the event handler.