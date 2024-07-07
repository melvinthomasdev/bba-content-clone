We can get access to the text inside an
HTML element using its `innerText` property.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>Happiness</p>
</panel>
<panel language="javascript">
let emotion = document.querySelector('p');
console.log(emotion.innerText);
emotion.innerText = "Contentment";
</panel>
</code>
</codeblock>

As you can see in the console,
it logs the text **Happiness**. But, the
text content later changes to **Contentment**. The updated text
is displayed in the browser.