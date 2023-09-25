Update the code provided below
according to the following
requirements:

- Add `Fruit Cart` as the Table title.
- Update the table contents with proper
table headings and table body elements.
- Add a new row for fruit `Apple`
with emoji `🍎`.
- Include columns for `Sr. No.`,
`Fruit name` and `Emoji`.

<codeblock language="html" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="page">
  <h1>Welcome to HTML Table Challenge</h1>
  <table>
    <tr>
      <td>Sr. No.</td>
      <td>Fruit</td>
      <td>Emoji</td>
    </tr>
    <tr>
      <td>1</td>
      <td class="fruit-name">Mango</td>
      <td class="emoji">🥭</td>
    </tr>
    <tr>
      <td>2</td>
      <td class="fruit-name">Kiwi Fruit</td>
      <td class="emoji">🥝</td>
    </tr>
    <tr>
      <td>3</td>
      <td class="fruit-name">Strawberry</td>
      <td class="emoji">🍓</td>
    </tr>
    <tr>
      <td>4</td>
      <td class="fruit-name">Grapes</td>
      <td class="emoji">🍇</td>
    </tr>
    <tr>
      <td>5</td>
      <td class="fruit-name">Cherries</td>
      <td class="emoji">🍒</td>
    </tr>
  </table>
</div>
</panel>
<panel language="css" hidden="true">
.page {
  display: flex;
  flex-direction: column;
  align-items: center
}
table {
  font-size: 3rem;
  border: 3px solid black;
  font-family: Lato;
  margin: 0 auto;
}

th, td {
  border: 3px solid black;
  box-shadow: 0px 0px 2px black;
}

.emoji {
  background-color: lightskyblue;
}

th {
  background-color: black;
  color: snow;
}

.fruit-name {
  background-color: lightcoral;
}
</panel>
</code>
<solution>
<div class="page">
  <h1>Welcome to HTML Table Challenge</h1>
  <table>
    <caption>Fruit Cart</caption>
    <thead>
      <th>Sr. No.</th>
      <th>Fruit</th>
      <th>Emoji</th>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td class="fruit-name">Mango</td>
        <td class="emoji">🥭</td>
      </tr>
      <tr>
        <td>2</td>
        <td class="fruit-name">Kiwi Fruit</td>
        <td class="emoji">🥝</td>
      </tr>
      <tr>
        <td>3</td>
        <td class="fruit-name">Strawberry</td>
        <td class="emoji">🍓</td>
      </tr>
      <tr>
        <td>4</td>
        <td class="fruit-name">Grapes</td>
        <td class="emoji">🍇</td>
      </tr>
      <tr>
        <td>5</td>
        <td class="fruit-name">Cherries</td>
        <td class="emoji">🍒</td>
      </tr>
      <tr>
        <td>6</td>
        <td class="fruit-name">Apple</td>
        <td class="emoji">🍎</td>
      </tr>
    </tbody>
  </table>
</div>
</solution>
</codeblock>
