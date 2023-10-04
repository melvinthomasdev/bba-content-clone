Using the **Styling Lists** knowledge that you have
gained so far, do the following:

- For list with class of `ice-cream`:

  1. Change the numbering style from decimal to **lower roman** numbers.

  2. Change the position of the marker to **inside**.

- For list with class of `sports`:

  1. Use **image** [https://www.w3schools.com/cssref/sqpurple.gif](https://www.w3schools.com/cssref/sqpurple.gif) as list item marker.

- For list with class of `footer`:

  1. Change the links in the footer to have **no list** marker.

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div>
  <ol class="ice-cream">
      <li>Butterscotch</li>
      <li>Vanilla</li>
      <li>Chocolate Chip</li>
      <li>Strawberry</li>
      <li>Pista</li>
  </ol>

  <ul class="sports">
      <li>Football</li>
      <li>Hockey</li>
      <li>Volleyball</li>
      <li>Basketball</li>
  </ul>

  <ul class="footer">
      <li><a href="#">Contact Us</a></li>
      <li><a href="#" >Home</a></li>
      <li><a href="#">About</a></li>
  </ul>
</div>
</panel>
<panel language="css">
.ice-cream {
  /* Write your code here */

}

.sports {
  /* Write your code here */

}

.footer {
  border-top: 1px solid grey;
  text-align: center;
  /* Write your code here */

}
</panel>
</code>
<solution>
.ice-cream {
  /* Write your code here */
  list-style-type: lower-roman;
  list-style-position: inside;
}

.sports {
  /* Write your code here */
  list-style-image: url('https://www.w3schools.com/cssref/sqpurple.gif');
}

.footer {
  border-top: 1px solid grey;
  text-align: center;
  /* Write your code here */
  list-style-type: none;
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

[Here is the link](https://bigbinaryacademy.slack.com/join/shared_invite/zt-23dvxwolx-U9LYYbv4ycmODEA1cbNFgA#/shared-invite/email) to join the community.
