Use `align-self` to push
the **Read more** button to
the right:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<article>
  <h2>The Sun</h2>
  <p>The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma.</p>
  <a href="#">Read more</a>
</article>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
article {
  display: flex;
  flex-direction: column;
  width: 300px;
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
  width: 300px;
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
  align-self: flex-end;
}
</solution>
</codeblock>