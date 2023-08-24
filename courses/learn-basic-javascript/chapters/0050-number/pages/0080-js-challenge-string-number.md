Create a variable`distanceInKM`,
which stores the number
`1435.9` as distance
between Delhi and
Mumbai in kilometers.

Display `distanceInKM` to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write your code here
</code>
<solution>
// Write your code here
const distanceInKM = 1435.9;
console.log(distanceInKM);
</solution>
</codeblock>

Create two variables `firstName` and `lastName`
and
store to it the values `"Sam"` and `"Smith"`
respectively.

Then join the variables `firstName`
and `lastName`, separated by a
space and assign it to a new
variable named `fullName`.

Display the value of the variable `fullName` in the console

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const firstName = "Sam";
const lastName = "Smith";
// Write your code here
</code>
<solution>
const firstName = "Sam";
const lastName = "Smith";
const fullName = `${firstName} ${lastName}`;
console.log(fullName);
</solution>
</codeblock>

If you notice, the names,
`Thanos` and `Captain America`
are repeated multiple times.

To fix that store them in variables
named `villain` and `hero` respectively
and
use these variables in the
`excerptFromMoviePlot` text instead.

Also, fix any other errors with the
below code and display the variable
`excerptFromMoviePlot` in the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const excerptFromMoviePlot = "As Earth faces its gravest threat yet, the Avengers reunite to thwart the diabolical plans of Thanos, a powerful intergalactic warlord.  Iron Man, Captain America, Thor, Black Widow, Hulk, and new allies like Captain Marvel embark on a perilous journey across time and space, seeking to reverse the catastrophic "Snap", with sacrifices made and alliances tested, Captain America must rally the Avengers to stand against the relentless might of Thanos and protect the universe from his tyrannical reign.
</code>
<solution>
const villain = "Thanos";
const hero = "Captain America";

const excerptFromMoviePlot = `As Earth faces its gravest threat yet, the Avengers reunite to thwart the diabolical plans of ${villain}, a powerful intergalactic warlord.  Iron Man, ${hero}, Thor, Black Widow, Hulk, and new allies like Captain Marvel embark on a perilous journey across time and space, seeking to reverse the catastrophic "Snap", with sacrifices made and alliances tested, ${hero} must rally the Avengers to stand against the relentless might of ${villain} and protect the universe from his tyrannical reign.`

console.log(excerptFromMoviePlot);
</solution>
</codeblock>

Four friends, Sam, Smith, Evan, and Renu
received a treasure bag containing **103**
gold coins instead of money.
They decided to divide the treasure equally
among themselves and donate any extra coins
to charity.
Later they decided to give 1 more coin to charity.

- Provided is the function `findExtraCoins`
  that takes two parameters:
  `totalCoins` and `numberOfPeople`.
- Update the function to calculate the number of
  extra coins left after dividing the `totalCoins`
  equally among the `numberOfPeople`.
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