Update the code below to match
the following requirements:

- Fix all issues in the code below
by applying the best practices learnt
so far.
- Make sure all the lists are numbered
and links are functional.
- Use proper table caption, heading and
body elements.

<codeblock language="html" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="page">
  <h1>Welcome to HTML Table, Headings and Images challenge</h1>
  <ol>
    <li>Mint Chocolate Chip</li>
    <li>Love Potion #31</li>
    <li>Oreo Cookies 'n' Cream</li>
    <li>Very Berry Strawberry</li>
    <li>Chocolate Chip Cookie Dough</li>
  </ol>

  <a href="https://www.google.com>Link to Google</a>
  <img src="https://images.unsplash.com/photo-1672078857105-a1229a7033b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80" alt="A burger split in two"/>

  <li>Pizza</li>
  <li>Sandwich</li>
  <li>Burger</li>

  <table>
    <tbody>
      <h2>Office Address</h2>
      <tr>
        <td>Address Line 1</td>
        <td>Address Line 2</td>
      </tr>
      <tr>
        <td>124</td>
        <td>New Delhi</td>
      </tr>
    </tbody>
  </table>
</div>
</panel>
<panel language="css" hidden="true">
form {
  font-family: Lato;
  border-radius: 10px;
  padding: 1rem;
  box-shadow: 0px 0px 4px;
  background-color: snow;
  font-size: 1.2rem;
  display: flex;
  flex-direction: column;
  width: 60%;
}

form * {
  margin: 0.5rem;
}

button {
  border: none;
  width: 40%;
  margin: 1;
  padding: 0.5rem;
  font-size: 1.2rem;
  font-weight: 700;
  box-shadow: 0px 0px 1px black;
  border-radius: 2px;
}

button[type="submit"] {
  background-color: royalblue;
  color: white;
}

button[type="reset"] {
  background-color: tomato;
  color: white;
}

img {
  width: "300px"
}
</panel>
</code>
<solution>
<div class="page">
  <h1>Welcome to HTML Table, Headings and Images challenge</h1>
  <ol>
    <li>Mint Chocolate Chip</li>
    <li>Love Potion #31</li>
    <li>Oreo Cookies 'n' Cream</li>
    <li>Very Berry Strawberry</li>
    <li>Chocolate Chip Cookie Dough</li>
  </ol>

  <a href="https://www.google.com">Link to Google</a>
  <img src="https://images.unsplash.com/photo-1672078857105-a1229a7033b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80"  alt="A burger split in two"/>

  <ol>
    <li>Pizza</li>
    <li>Sandwich</li>
    <li>Burger</li>
  </ol>

  <table>
    <caption>Office Address</caption>
    <thead>
      <tr>
        <th>Address Line 1</th>
        <th>Address Line 2</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>124</td>
        <td>New Delhi</td>
      </tr>
    </tbody>
  </table>
</div>
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
