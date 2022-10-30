Add a `keyup` event to the input element,
so that when someone types in anything in
the input, the count of the key press should go up
and this count should be shown in the span
below it.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<input type="text" placeholder="About You" />
<p>Key Count: <span></span></p>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let inputValue = document.querySelector("input");
let spanValue = document.querySelector("span");
let keyCount = 0;

inputValue.addEventListener("keyup", () => {
  keyCount++;
  spanValue.textContent = `${keyCount}`;
});
</solution>

<domtestevents>
<event>
document.querySelector('input').dispatchEvent(new KeyboardEvent('keyup',{'key':'a'}));
</event>
</domtestevents>
</Editor>