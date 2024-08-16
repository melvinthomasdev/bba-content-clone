Start with adding the text **Personal Details** to an **h2** element.

Below the heading, add a **form** element with a **class** attribute set to **"personal-details-form"**.

Inside the form element,

Add a **label** element with text **Username** with a **for** attribute set as **username**. Below that, add an input element with the **placeholder** attribute set as **Renu Sen** to allow users to enter their name.

Below that, add a **label** element with the text **Password** with a **for** attribute set as **password**. Below that, add an input element to allow user to enter their password.

Below that, add a **label** element with the text **Address** with a **for** attribute set as **address**. Below that, add an input element with the **placeholder** attribute set as **World Trade Center, Kharadi, Pune, Maharashtra 41101** to allow user to enter their full address.
Make sure the element has 4 rows and 50 columns.

Below that, add a **label** element with the text **Favourite Ice Cream Flavour** with a **for** attribute set as **flavour**.

Below that, add a dropdown menu for the users to select their favorite ice cream flavours.
Selections should have options for the following flavours:

1. Chocolate
2. Vanilla
3. Strawberry
4. Pista
5. Butterscotch

The option value should match the flavor, but in lowercase.

Below that, add a **label** element with the text **Phone Number** with a **for** attribute set as **phone-number**. Below that, add an input element with the **placeholder** attribute set as **+911234567890** to allow user to enter their phone number.

Below the phone number field, add a **div** element with a class of **"button-container"**.

Inside this **div** element, add two **Button** elements.
The first one, upon clicking, should reset all the data entered in the form. This button should have the text `Reset`.

The second button should have the text `Submit`.
When clicked, this button should submit the form.
Make sure to specify their types.

You need to ensure that if we click any of the labels, the input element associated with it should be highlighted.

Don't add any unnecessary `id`, `name` or `class` attribute.

<codeblock language="html" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<!-- Write your code below -->
</panel>
<panel language="css" hidden="true">
.personal-details-form {
  font-family: Lato;
  border-radius: 10px;
  padding: 1rem;
  box-shadow: 0px 0px 4px;
  background-color: snow;
  font-size: 1.2rem;
  display: flex;
  flex-direction: column;
}

.personal-details-form \* {
margin: 0.5rem;
}

input[type="text"],
input[type="password"],
input[type="tel"] {
padding: 0.5rem;
border: 1px solid #ccc;
border-radius: 4px;
font-size: 1rem;
width: 60%; /_ Reduced width for text, password, and tel inputs _/
box-sizing: border-box;
}

textarea,
select {
padding: 0.5rem;
border: 1px solid #ccc;
border-radius: 4px;
font-size: 1rem;
width: 70%;
box-sizing: border-box;
}

select {
width: 30%;
}

input[type="text"]:focus,
input[type="password"]:focus,
textarea:focus,
select:focus,
input[type="tel"]:focus {
outline: none;
border-color: royalblue;
}

.button-container {
display: flex;
align-items: center;
width: 100%;
}

button {
padding: 0.5rem;
font-size: 1.2rem;
font-weight: 700;
box-shadow: 0px 0px 1px black;
border-radius: 2px;
width: 17%;
min-width: 110px;
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
<!-- Write your code below -->
<h2>Personal Details</h2>
<form class="personal-details-form">
  <label for="username">Username</label>
  <input type="text" id="username" placeholder="Renu Sen">

  <label for="password">Password</label>
  <input id="password" type="password">

{" "}
<label for="address">Address</label>
<textarea
  id="address"
  rows="4"
  cols="50"
  placeholder="World Trade Center, Kharadi, Pune, Maharashtra 41101"
></textarea>

{" "}
<label for="flavour">Favourite Ice Cream Flavour</label>
<select id="flavour">
  <option value="chocolate">Chocolate</option>
  <option value="vanilla">Vanilla</option>
  <option value="strawberry">Strawberry</option>
  <option value="pista">Pista</option>
  <option value="butterscotch">Butterscotch</option>
</select>

  <label for="phone-number">Phone Number</label>
  <input id="phone-number" type="tel" placeholder="+911234567890">

  <div class="button-container">
    <button type="reset">Reset</button>
    <button type="submit">Submit</button>
  </div>
</form>
</solution>
</codeblock>

We are not displaying the answer for this challenge.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
