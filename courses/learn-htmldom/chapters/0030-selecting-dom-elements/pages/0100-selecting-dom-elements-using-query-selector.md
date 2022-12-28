`querySelector` will select
the first HTML element which matches the
provided query and ignore the rest.
This is a versatile
selector
and
can match using any of the
CSS selectors. It can use class name, tag name,
id name or any complex selector too.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h2>Interesting Choice of Words</h2>
<p>A paragraph that states nothing new.</p>
<p class = "interesting-paragraph">A paragraph that could have been interesting.</p>
<p id = "brutal-paragraph">This paragraph <span>doesn't</span> inspire.</p>
</panel>
<panel language="javascript">
let firstParagraph = document.querySelector('p');
let secondParagraph = document.querySelector('.interesting-paragraph');
let thirdParagraph = document.querySelector('#brutal-paragraph');
firstParagraph.style.fontSize = "16px";
secondParagraph.style.fontSize = "32px";
thirdParagraph.style.fontSize = "24px";

// A complex selector

let inspirationConfirmation = document.querySelector('#brutal-paragraph>span');
inspirationConfirmation.textContent = "does";
inspirationConfirmation.style.color = "blue";
</panel>
</code>
</codeblock>

The selectors that we pass in this
method are simply the selectors
that we have used in CSS. This means you
can use `#` to select using the id, `.` to
select the elements using their class.
You can go as detailed as possible
with your selectors.

For example, the `inspirationConfirmation`
variable gets its value through a complex
CSS selector in `document.querySelector('#brutal-paragraph>span')`.
