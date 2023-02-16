<!--
The reason why I have not included
getAttribute is because the only
advantage it brings over querying property values
directly, is that it can query the value of
non-standard HTML attributes too.

This seems too miniscule a benefit
for students to be taught 2 ways of
doing the same thing.
 -->

You can access the attribute values for an HTML element,
element, by simply looking up the value
of that property on the node object.

Look at the example given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<form id = "user-info">
    <input type = "text" class = "user-input" value = "Name">
    <input type = "text" class = "user-input" value = "Email">
    <input type = "text" class = "user-input" value = "Address">
    <input type = "submit" value = "submit">
</form>
</panel>
<panel language="javascript">
let allUserInputs = document.getElementsByClassName('user-input');
for (let userInput of allUserInputs) {
    console.log(`This is an input of the type '${userInput.type}' and it collects the user's ${userInput.value}`);
}
</panel>
</code>
</codeblock>

In the example given above, we
simply looked up the value
of the `type` and
`value` properties on each of the input
node objects.
