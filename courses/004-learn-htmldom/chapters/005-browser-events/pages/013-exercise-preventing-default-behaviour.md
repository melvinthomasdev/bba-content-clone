In the example given below, we do not
want the `a` element to redirect us to
the link. Instead, we want to display the
link address in a `p` element whenever someone
clicks on the link. 

Write the code to implement
these changes:

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<section>
    <div>
        <a href="https://www.google.com/">Link to a webpage</a>
    </div>
    <p>Overwrite this text with the link address</p>
</section>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let paragraph = document.querySelector('p');
let link = document.querySelector('a');
link.addEventListener("click", (event) => {
    event.preventDefault();
    paragraph.textContent = link.href;
});
</solution>

<domtestevents>
<event>
document.querySelector('a').click();
</event>
</domtestevents>
</Editor>