We can get access to the text inside an
HTML element using its `textContent` property.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p id="message">Congratulations</p>
</panel>
<panel language="javascript">
let message = document.querySelector('#message');
console.log(message.textContent);
message.textContent = "Better greetings";
</panel>
</code>
</codeblock>

As you can see in the console,
it logs the text **Congratulations**. But, the
text content later changes to **Better greetings**. The updated text
is displayed in the browser.