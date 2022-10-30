The `article` element is a
flex container with the
direction set to `column`.
This makes the **Read more**
button stretch, because that's
the default behaviour.
Use `align-items` property on
`article` to align it at the
beginning and not stretch:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<article>
  <h2>The Sun</h2>
  <p>The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma.</p>
  <a href="#">Read more</a>
</article>
</panel>
<panel lang="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
article {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 300px;
  height: 300px;
  padding: 30px;
  background-color: #FFF7ED;
}
p {
  padding-top: 10px;
}
a {
  margin-top: 15px;
  padding: 12px 15px;
  background-color: #EA580C;
  color: white;
  text-decoration: none;
}
</panel>
</code>

<solution>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
article {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  width: 300px;
  height: 300px;
  padding: 30px;
  background-color: #FFF7ED;
}
p {
  padding-top: 10px;
}
a {
  margin-top: 15px;
  padding: 12px 15px;
  background-color: #EA580C;
  color: white;
  text-decoration: none;
}
</solution>
</Editor>