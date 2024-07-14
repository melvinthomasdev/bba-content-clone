Using the CSS **Position** knowledge that you have
gained so far, do the following:

1. Let's make **Pineapple heading** sticky with top offset of `2rem`.

2. Let's make **Apple heading** positioned at the top left corner and on top of **Pineapple heading**.

3. Let's position **Mango heading** like a chat button. Always on top and fixed to bottom right corner.

4. Let's make **Pineapple paragraph** sticky to bottom.

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="page">
  <h1 id="apple-heading">Apple 🍏</h1>
  <h1 id="mango-heading">Mango 🥭</h1>
  <h1 id="pineapple-heading">Pineapple 🍍</h1>
  <h1>Strawberry 🍓</h1>
  <h1>Grapes 🍇</h1>
  <h1>Watermelon 🍉</h1>
  <p>Paragraph 2</p>
  <p>Paragraph 3</p>
  <p>Paragraph 4</p>
  <p>Paragraph 5</p>
  <p>Paragraph 6</p>
  <p>Paragraph 7</p>
  <p>Paragraph 8</p>
  <p>Paragraph 9</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p id="pineapple-paragraph">🍍 Pineapple Details</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
  <p>Paragraph 10</p>
</div>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
}

body {
  background-color: oldlace;
  font-family: Raleway, sans-serif;
}

.page {
  position: relative;
}

h1 {
  background-color: bisque;
  margin-top: 1rem;
  padding: 1rem;
  box-shadow: 4px 4px 4px peachpuff;
}

p {
  background-color: mediumvioletred;
  color: white;
  margin-top: 0.5rem;
  font-family: Roboto, sans-serif;
  padding: 0.5rem;
}

#pineapple-heading {
  background-color: yellow;
  padding: 1rem;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
  /* Write your code here */

}

#apple-heading {
  background-color: mediumpurple;
  padding: 1rem;
  z-index: 1;
  /* Write your code here */

}

#mango-heading {
  background-color: tomato;
  padding: 1rem;
  cursor: pointer;
  /* Write your code here */

}

#pineapple-paragraph {
  background-color: orange;
  padding: 0.5rem;
  /* Write your code here */

}
</panel>
</code>

<solution>
* {
  margin: 0;
  padding: 0;
}

body {
  background-color: oldlace;
  font-family: Raleway, sans-serif;
}

.page {
  position: relative;
}

h1 {
  background-color: bisque;
  margin-top: 1rem;
  padding: 1rem;
  box-shadow: 4px 4px 4px peachpuff;
}

p {
  background-color: mediumvioletred;
  color: white;
  margin-top: 0.5rem;
  font-family: Roboto, sans-serif;
  padding: 0.5rem;
}

#pineapple-heading {
  background-color: yellow;
  padding: 1rem;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
  position: sticky;
  top: 2rem;
}

#apple-heading {
  background-color: mediumpurple;
  padding: 1rem;
  z-index: 1;
  position: absolute;
  top: 0;
  left: 0;
}

#mango-heading {
  background-color: tomato;
  padding: 1rem;
  cursor: pointer;
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 2;
}

#pineapple-paragraph {
  background-color: orange;
  padding: 0.5rem;
  position: sticky;
  bottom: 0;
}
</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
