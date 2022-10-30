There is another way we can handle
events in JavaScript.

Take the cursor over to the brown
rectangle in the example given below:

<Editor lang="javascript">
<code>
<panel lang="html">
<div>
    <p></p>
</div>
</panel>
<panel lang="css">
div {
    background-color: brown;
    width: 200px;
    height: 200px;
    color: snow;
    display: flex;
    justify-content: center;
    align-items: center;
}
</panel>
<panel lang="javascript">
let divElement = document.querySelector('div');
let pElement = document.querySelector('p');
divElement.onmouseover = () => {
    pElement.textContent = "Hello there!";
}
</panel>
</code>
</Editor>

A DOM object that creates an event
will have a property to handle that
event. In this example, the `div` element
listens for the `mouseover` event and
hence has a property `onmouseover` that
we can control. You can try this by yourself
for any event. Just look up the name of the
event and the property that handles it. For
`click` event, the property is `onclick`, for
`keyUp` event, the property is `onkeyup`, etc.