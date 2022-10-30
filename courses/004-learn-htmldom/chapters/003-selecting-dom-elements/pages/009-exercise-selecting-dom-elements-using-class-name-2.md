In the example given below,
change the colour of all `a`
elements with the class name
**external-link** to
**green** using
`getElementsByClassName`. Also, change the
colour of the second link with the
class name **external-link** to **tomato**.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<p>Internal Link: <a href="#">Home</a></p>
<p>External Links:
  <a href="#" class="external-link">This is Safe</a>
  <a href="#" class="external-link">Don't click. Unsafe!</a>
  <a href="#" class="external-link">Totally Safe!</a>
</p>
</panel>
<panel lang="css">
a {
    margin-left: 1rem;
  }
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let secureLinks = document.getElementsByClassName('external-link');
for(let link of secureLinks) {
  link.style.color = "green";
}
secureLinks[1].style.color = "tomato";
</solution>
</Editor>