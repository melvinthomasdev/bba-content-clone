The `innerHTML` property will return to us
all the HTML that is nested inside the element.
The `outerHTML` property, on the other hand, will
return to us not only the HTML that is nested
inside the element, but also the element itself.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<section>
    <p>Inner Text</p>
</section>
</panel>
<panel language="javascript">
let relevantInformation = document.querySelector('section');
console.log("OuterHTML:")
console.log(relevantInformation.outerHTML);
console.log("InnerHTML:")
console.log(relevantInformation.innerHTML);
</panel>
</code>
</codeblock>

The result in the console shows us
that for getting the element as well as
the nested HTML inside it, we should use `outerHTML`.
But to get only the nested HTML inside an
element, we can use `innerHTML`.
