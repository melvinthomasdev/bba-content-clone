Update the code provided below
by adding an `aside` element in
the `<main>` tag above
the paragraph element.

In the `aside` element, add an image
with the following source:
`https://ucarecdn.com/8b4a9a74-3de8-46cb-b394-ad767f8b4d58/-/resize/250x/`

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header>
  <h1>Your friendly Neighborhood Spiderman!</h1>
</header>
<main>
  <!-- Write code below -->
  <p>"With great power, comes great responsibility"</p>
  <p>- Uncle Ben</p>
</main>
</panel>
<panel language="css">
* {
  background-color: blue;
  font-family: Arial, sans-serif;
}
header {
  color: red;
  text-align: center;
  padding: 10px;
  border-bottom: 0.5px solid #f0f0f0;
}
aside {
  float: left;
  padding: 0 30px;
  border-radius: 10px;
}
p {
  text-align: center;
  color: white;
  padding: 10px;
}
</panel>
</code>

<solution>
<header>
  <h1>Your friendly Neighborhood Spiderman!</h1>
</header>
<main>
  <!-- Write code below -->
  <aside>
    <img src="https://ucarecdn.com/8b4a9a74-3de8-46cb-b394-ad767f8b4d58/-/resize/250x/">
  </aside>
  <p>"With great power, comes great responsibility"</p>
  <p>- Uncle Ben</p>
</main>
</solution>
</codeblock>
