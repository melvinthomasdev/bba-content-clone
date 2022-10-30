The `flex-direction` of
container is set to `column`.
Using the `justify-content`
property, vertically align
the two links in the center:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div class="container">
  <a href="#">Register</a>
  <a href="#">Login</a>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
  flex-direction: column;
  width: 220px;
  padding: 30px;
  min-height: 300px;
  background-color: teal;
  text-align:center;
}
.container a{
  margin: 10px;
  padding: 12px;
  background-color: white;
  font-family: sans-serif;
  color: #333333;
  text-decoration: none;
  border-radius: 5px;
}
</panel>
</code>

<solution>
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 220px;
  padding: 30px;
  min-height: 300px;
  background-color: teal;
  text-align:center;
}
.container a{
  margin: 10px;
  padding: 12px;
  background-color: white;
  font-family: sans-serif;
  color: #333333;
  text-decoration: none;
  border-radius: 5px;
}
</solution>
</Editor>