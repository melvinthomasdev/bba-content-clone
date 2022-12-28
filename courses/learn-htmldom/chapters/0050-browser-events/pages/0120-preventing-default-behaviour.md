Sometimes, it is useful to block the
default behaviour of an event.

In the example given below, we want
that no one be able to type anything
in the `input`. For this, we
create an event listener for a `keydown` event
for the given `input`. Then, we block its
default behaviour and now, no one can type
anything inside it.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<input type = "text" placeholder = "cannot type here" />
</panel>
<panel language="javascript">
let myInput = document.querySelector('input');
myInput.addEventListener("keydown", function(event) {
    event.preventDefault();
});
</panel>
</code>
</codeblock>

The `preventDefault` method blocks the
event's default behaviour. It can be used
on most events. To know whether an event can be
cancelled, check its `event.cancelable` property.
