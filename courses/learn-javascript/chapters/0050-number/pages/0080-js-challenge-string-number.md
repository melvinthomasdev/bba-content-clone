## Challenge - 1

Create a variable`distanceInKM`,
which stores the number
`1435.9` as distance
between Delhi and
Mumbai in kilometers.

Display the value of `distanceInKM`
to the console.

For example:
```
distanceInKM = 1000
```

Expected Output:
```
1000
```
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

If you notice, the names,
`Thanos` and `Captain America`
appear more than once.

Improve the code by storing
these names in variables
named `villain` and `hero`
respectively
and
use these variables in the
`excerptFromMoviePlot` text instead.

Also, fix any other errors with the
below code and display the variable
`excerptFromMoviePlot` in the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const excerptFromMoviePlot = "As Earth faces its gravest threat yet, the Avengers reunite to thwart the diabolical plans of Thanos, a powerful intergalactic warlord. Iron Man, Captain America, Thor, Black Widow, Hulk, and new allies like Captain Marvel embark on a perilous journey across time and space, seeking to reverse the catastrophic "Snap", with sacrifices made and alliances tested, Captain America must rally the Avengers to stand against the relentless might of Thanos and protect the universe from his tyrannical reign.
</code>
<solution>
const villain = "Thanos";
const hero = "Captain America";

const excerptFromMoviePlot = `As Earth faces its gravest threat yet, the Avengers reunite to thwart the diabolical plans of ${villain}, a powerful intergalactic warlord. Iron Man, ${hero}, Thor, Black Widow, Hulk, and new allies like Captain Marvel embark on a perilous journey across time and space, seeking to reverse the catastrophic "Snap", with sacrifices made and alliances tested, ${hero} must rally the Avengers to stand against the relentless might of ${villain} and protect the universe from his tyrannical reign.`

console.log(excerptFromMoviePlot);
</solution>
</codeblock>

## Challenge - 4

Four friends, Sam, Smith, Evan, and Renu
received a treasure bag containing **103**
gold coins instead of money.
They decided to divide the treasure equally
among themselves and donate any extra coins
to charity.
Later they decided to give 1 more coin to charity.

- Provided below is the function `findExtraCoins`
  that takes two parameters:
  `totalCoins` and `numberOfPeople`.
- Update the `findExtraCoins` function to calculate
  the number of extra coins left after dividing
  the `totalCoins` equally among the `numberOfPeople`.
- Store the number of extra coins in a variable
  named `charity`.
- Print the value of the `charity` variable to
  the console.
- Using the appropriate operator,
  increase the value of the charity variable
  by 1 and print it again to the console.
<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const totalGoldCoins = 103;
const totalNumberOfPeople = 4;
const findExtraCoins = (totalCoins, numberOfPeople) => {
  // Write your code here
};

findExtraCoins(totalGoldCoins, totalNumberOfPeople);
</code>
<solution>
const totalGoldCoins = 103;
const totalNumberOfPeople = 4;

const findExtraCoins = (totalCoins, numberOfPeople) => {
// Write your code here
  let charity = totalGoldCoins % numberOfPeople
  console.log(charity);
  charity += 1;
  console.log(charity);
};

findExtraCoins(totalGoldCoins, totalNumberOfPeople);
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
