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

{" "}
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
/_ Write your code here _/

}

.footer {
border-top: 1px solid grey;
text-align: center;
/_ Write your code here _/

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
/_ Write your code here _/
list-style-image: url('https://www.w3schools.com/cssref/sqpurple.gif');
}

.footer {
border-top: 1px solid grey;
text-align: center;
/_ Write your code here _/
list-style-type: none;
}

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
