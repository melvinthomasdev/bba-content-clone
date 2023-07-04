The **dataset** attributes can be
selected using JavaScript.
To do this, we have to convert
their values into camel case.

Let us have a look at an example:
<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div
  id="user"
  data-test-id="1034"
  data-user-name="Willy Wonka"
>
Willy Wonka
</div>
</panel>

<panel language="javascript">
// Accessing the HTML element
const divElement = document.querySelector('#user');

// Accessing data attribute values from
// the selected HTML element.
const userName = divElement.dataset.userName;

console.log(userName);
</panel>
</code>
</codeblock>

As we can see, data attributes
can be accessed in **JavaScript**
with this syntax:
`element.dataset.keyName`.

We can also use the bracket syntax
`element.dataset[keyName]`.

Let us have a look at another example:
<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div
  id="cookie"
  data-cookie-type="choco-chip"
>
Ice cream factory
</div>
</panel>
<panel language="javascript">
// Accessing the HTML element
const divElement = document.querySelector('#cookie');

// Accessing data attribute values from
// the selected HTML element.
const cookieType = divElement.dataset["cookieType"];

console.log(cookieType);
</panel>
</code>
</codeblock>
