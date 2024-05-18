There can be many events
going on in the browser
at the same time,
like mouse clicks,
mouse movements,
key-presses, etc.

We need the browser to
wait for a particular event
to occur, and after that perform
a set of instructions.

Look at the example given below and
try to copy the text in the
paragraph:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p></p>
</panel>
<panel language="javascript">
let result = document.querySelector('p');
result.textContent = "Try copying this text.";
const handleCopy = () => {
  console.log("Data Copied");
}
result.addEventListener('copy', handleCopy);
</panel>
</code>
</codeblock>

In the example given above, we are listening to
an event on the `p` DOM object using the
`addEventListener` method.
This listener method will monitor
the DOM object for a particular event.

The `addEventListener` accepts 2 parameters:

1. Name of the event.
2. A function which will run the code that 
we want to execute once that particular event occurs.

In the above case, the name of the event is **copy**.
As soon as someone copies the code from the `p` element, 
our function `handleCopy` inside the
`addEventListener` runs.

Let's look at another example and try to select the text 
inside the input:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<input value="Select me">
</panel>
<panel language="javascript">
let result = document.querySelector('input');
const handleSelect = (data) => {
  console.log(data);
}
result.addEventListener('select', () => handleSelect('Data Selected'));
</panel>
</code>
</codeblock>

In the example given above, we are listening to
an event on the `input` DOM object.
When you select the text inside the `input` element,
the function inside the `addEventListener` runs.
The function runs even when you select a single character
inside the `input` element.

It must be kept in mind
that the **select** event
only gets fired on
`input` elements
and
`textarea` elements.

In this case, the function inside the `addEventListener` 
we have used is called an
**anonymous function**. 
You can notice the difference in the two ways 
in which we are passing the function inside the 
`addEventListener`. In this second manner shown 
here, we are able to pass
parameters to the named function `handleSelect`.

Contrast this with the previous approach in which 
we directly provide the name of the function.
For this, try replacing the addEventListener line 
in the above code 
with the following line:

```
result.addEventListener('select', handleSelect('Data Selected'));
```

You will notice that the above code 
does not give us correct result. In this case, 
the function will not wait for the event 
to get fired and directly executes.

This happens because `()` will 
call the function. So, when we do not 
have a parameter, we can use the first approach of 
providing the function name in the `addEventListener`. 
When we have parameters in our function, 
we should use the second approach of using 
anonymous functions that call our function as 
shown in the second example.
