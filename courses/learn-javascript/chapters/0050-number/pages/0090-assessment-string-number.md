## Challenge - 1

Create a variable`distanceInKM`,
which stores the number
`1435.9` as distance
between Delhi and
Mumbai in kilometers.

Display the value of `distanceInKM`
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write your code below
</code>
<solution>
// Write your code below
const distanceInKM = 1435.9;
console.log(distanceInKM);
</solution>
</codeblock>

## Challenge - 2

Declare two variables named `firstName`
and
`lastName`.
Assign them with the values
`"Sam"` and `"Smith"` respectively.

Then join the variables `firstName`
and `lastName`, separated by a
space and assign the result
to a new variable named `fullName`.

Display the value of the variable
`fullName` in the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const firstName = "Sam";
const lastName = "Smith";
// Write your code below
</code>
<solution>
const firstName = "Sam";
const lastName = "Smith";
const fullName = `${firstName} ${lastName}`;
console.log(fullName);
</solution>
</codeblock>

## Challenge - 3

Four friends, Sam, Smith, Evan, and Renu
received a treasure bag containing **103**
gold coins instead of money.
They decided to divide the treasure equally
among themselves and donate any extra coins
to charity.
Later they decided to give 1 more coin to charity.

- Update the code to calculate
  the number of extra coins left after dividing
  the total coins equally among the specified
  number of people and store the number of extra
  coins in a variable named **charity**.
- Print the value of the **charity** variable to
  the console.
- Using the appropriate operator,
  increase the value of the charity variable
  by 1 and print it again to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const totalGoldCoins = 103;
const totalNumberOfPeople = 4;

</code>
<solution>
const totalGoldCoins = 103;
const totalNumberOfPeople = 4;

let charity = totalGoldCoins % totalNumberOfPeople;

console.log(charity);

charity += 1;

console.log(charity);
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
