**dataset** attributes can be
selected using javascript by
their name in camelCase.

Let us have a look at an example:
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div
  id="user"
  data-test-id="1034"
  data-user-name="willyWonka"
>
Willy Wonka
</div>
</panel>
<panel language="javascript">
// Accessing the HTML element
const el = document.querySelector('#user');

// Accessing data attribute values from
// the selected HTML element.
const userName = el.dataset.dataUserName;

console.log(userName);
</panel>
</code>
</codeblock>

As we can see, data attributes
can accessed in **JavaScript**
with this syntax:
`element.dataset.keyName`.

We can also use the bracket syntax
`element.dataset.[keyName]`.

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
<panel language="javascript">
// Accessing the HTML element
const el = document.querySelector('#cookie');

// Accessing data attribute values from
// the selected HTML element.
const cookieType = el.dataset["dataCookieType"];

console.log(cookieType);
</panel>
</code>
</code>
</codeblock>
