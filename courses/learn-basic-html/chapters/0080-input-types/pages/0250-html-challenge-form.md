- Create a form with action attribute
set to "#" and the method to "post".
- Add a form heading `Identity`
- Below the heading add a label `Username:`
with **for** attribute set as `username`.
- Following the label add a text field
with **id**, **name** and **placeholder**
attributes set as `username`.

- Below the text field add a label `Password:`
- Add password input field with **name**
and
**placeholder** attributes as `password`.

- Below password field add label `Address:`.
- Add a textarea field with **name**
and **placeholder** attributes set
as `address`.
- Add **rows** attribute set as `4`
and
**cols** set as `50`.

- Below the address field add
a label `Favourite Ice Cream Flavour:`
- Create a dropdown menu for users
**name** attribute set as `ice-cream`
to select their favorite ice cream flavors.

- Selections should have options for
the following flavours:
 1. Chocolate
 2. Vanilla
 3. Strawberry
 4. Pista
 5. Butterscotch
- Option value should be the same
as the flavour.

- Add a label `Phone No.` and a telephone field
with **name** and **placeholder** attributes
set as `phone-no`.
- Below the phone number field add two buttons
one with type `reset`
and
another with type `submit`.

<codeblock language="html" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
# Write code below
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
}

form * {
  margin: 0.5rem;
}

button {
  border: none;
  padding: 0.5rem;
  font-size: 1.2rem;
  font-weight: 700;
  box-shadow: 0px 0px 1px black;
  border-radius: 2px;
}

button:hover {
  box-shadow: 2px 2px lightgray;
}

button[type="submit"] {
  background-color: royalblue;
  color: white;
}

button[type="reset"] {
  background-color: tomato;
  color: white;
}
</panel>
</code>
<solution>
<form action="#" method="post">
  <caption>Identity</caption>
  <label for="username">Username:</label>
  <input type="text" id="username" name="username" placeholder="username" />

  <label>Password:</label>
  <input type="password" name="password" placeholder="password" />

  <label>Address:</label>
  <textarea name="address" rows="4" cols="50" placeholder="address"></textarea>

  <label>Favourite Ice Cream Flavour:</label>
  <select name="ice-cream">
    <option value="Chocolate">Chocolate</option>
    <option value="Vanilla">Vanilla</option>
    <option value="Strawberry">Strawberry</option>
    <option value="Pista">Pista</option>
    <option value="Butterscotch">Butterscotch</option>
  </select>

  <label>Phone No.</label>
  <input type="tel" name="phone-no" placeholder="phone-no" />

  <button type="reset">Reset</button>
  <button type="submit">Submit</button>
</form>
</solution>
</codeblock>
