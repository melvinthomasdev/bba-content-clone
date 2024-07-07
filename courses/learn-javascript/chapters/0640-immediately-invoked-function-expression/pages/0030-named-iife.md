IIFE does not require a name.
But we can have named IIFEs
for traditional functional definition.

<codeblock language="javascript" type="lesson">
<code>
(function displayGreeting() {
  const message = "Hello, I am Sam Smith";
  console.log(message);
}());
</code>
</codeblock>

Do note that,
named IIFEs cannot be invoked
with an external function call
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
(function displayGreeting() {
  const message = "Hello, I am Sam Smith";
  console.log(message);
}());

displayGreeting();
</code>
</codeblock>