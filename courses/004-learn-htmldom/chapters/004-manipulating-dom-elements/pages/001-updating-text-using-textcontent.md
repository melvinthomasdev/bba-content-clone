We can get access to the text inside an
HTML element using its `textContent` property.

<Editor lang="javascript">
<code>
<panel lang="html">
<p id = "message">Congratulations</p>
</panel>
<panel lang="javascript">
let message = document.querySelector('#message');
console.log(message.textContent);
message.textContent = "Better greetings";
</panel>
</code>
</Editor>

As you can see in the console,
it logs the text **Congratulations**. But, the
text content later changes to **Better greetings**. The updated text
is displayed in the browser.