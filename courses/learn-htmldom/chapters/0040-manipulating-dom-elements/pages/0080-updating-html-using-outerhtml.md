We can access an HTML element
and all the nested code inside
it using its `outerHTML` property.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>
    The dogs
    <span>will </span>
    <span>be </span>
    <span>waiting.</span>
    <img src = "shih-tzu-dog-02.jpg" width = "350px">
</p>
</panel>
<panel language="javascript">
let scaryDog = document.querySelector('p');
console.log(scaryDog.outerHTML);
</panel>
</code>
</codeblock>

In the console,
we get a string representing
the `p` element and all the
nested elements inside it.