We can get access to all the HTML code
nested inside an
HTML element using
its `innerHTML` property.

<Editor lang="javascript">
<code>
<panel lang="html">
<p>
    Our Friends
    <span>in </span>
    <span>this </span>
    <span>ecosystem</span>
    <img src = "shih-tzu-dog-01.jpg" width = "350px">
</p>
</panel>
<panel lang="javascript">
let dogInfo = document.querySelector('p');
console.log(dogInfo.innerHTML);
</panel>
</code>
</Editor>

In the console,
we get all the
HTML nested inside
the `p` element.