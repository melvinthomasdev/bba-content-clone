We can get access to the text inside an
HTML element using its `innerText` property.

<Editor lang="javascript">
<code>
<panel lang="html">
<p>Happiness</p>
</panel>
<panel lang="javascript">
let emotion = document.querySelector('p');
console.log(emotion.innerText);
emotion.innerText = "Contentment";
</panel>
</code>
</Editor>

As you can see in the console,
it logs the text **Happiness**. But, the
text content later changes to **Contentment**. The updated text
is displayed in the browser.