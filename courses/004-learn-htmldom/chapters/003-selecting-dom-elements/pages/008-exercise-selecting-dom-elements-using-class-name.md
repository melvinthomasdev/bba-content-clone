In the example given below,
select all **stars**
and
give them
a text-shadow of `0px 0px 25px cyan`.
Then, select all the **full moons**
and
give them a text-shadow of
`0px 0px 25px orange`.
Use only the `getElementsByClassName` selector.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<p>
  <span class = "full-moon">🌕</span>
  <span class = "star">⭐</span>
  <span class = "star">⭐</span>
  <span class = "full-moon">🌕</span>
  <span class = "star">⭐</span>
  <span class = "star">⭐</span>
  <span class = "full-moon">🌕</span>
</p>
</panel>
<panel lang="css">
body {
  background-color: #222;
}

p {
  font-size: 3rem;
  display: flex;
  justify-content: space-around;
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let fullMoons = document.getElementsByClassName('full-moon');
let stars = document.getElementsByClassName('star');

for (let star of stars) {
  star.style.textShadow = "0px 0px 25px cyan";
}

for (let fullMoon of fullMoons) {
  fullMoon.style.textShadow = "0px 0px 25px orange";
}
</solution>
</Editor>