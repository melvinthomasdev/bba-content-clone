Create a variable`distanceInKM`,
which stores the number
`1435.9` as distance
between Delhi and
Mumbai in kilometers.

Display the variable `distanceInKM` in the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>

</code>
<solution>
const distanceInKM = 1435.9;
console.log(distance);
</solution>
</codeblock>

Create two variables `firstName` and `lastName` and store to it the values "Sam" and "Smith" respectively.
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

If you notice, the names, "Thanos" and "Captain America" are repeated multiple times. To fix that store them in a variable and use these variables in the `excerptFromMoviePlot` text instead.

Also, fix all other issues with the below
code, according to the best
practices learnt so far and then display the value of excerptFromMoviePlot in the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const excerptFromMoviePlot = "As Earth faces its gravest threat yet, the Avengers reunite to thwart the diabolical plans of Thanos, a powerful intergalactic warlord.  Iron Man, Captain America, Thor, Black Widow, Hulk, and new allies like Captain Marvel embark on a perilous journey across time and space, seeking to reverse the catastrophic "Snap", with sacrifices made and alliances tested, Captain America must rally the Avengers to stand against the relentless might of Thanos and protect the universe from his tyrannical reign.
</code>
<solution>
const mainVillain = "Thanos";
const captain = "Captain America";

const excerptFromMoviePlot = `As Earth faces its gravest threat yet, the Avengers reunite to thwart the diabolical plans of ${mainVillain}, a powerful intergalactic warlord.  Iron Man, ${captain}, Thor, Black Widow, Hulk, and new allies like Captain Marvel embark on a perilous journey across time and space, seeking to reverse the catastrophic "Snap", with sacrifices made and alliances tested, ${captain} must rally the Avengers to stand against the relentless might of ${mainVillain} and protect the universe from his tyrannical reign.`

console.log(excerptFromMoviePlot);
</solution>
</codeblock>

Four friends, Sam, Smith, Even, and Renu received a treasure bag containing 103 gold coins instead of money.
They decided to divide the treasure equally among themselves and donate any extra coins to charity.
Create appropriate JavaScript function to find the number of coins that will be extra.
Store this in a variable `charity` and print the value of this variable to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write your code here
</code>
<solution>
const totalGoldCoins = 103;
const numberOfPeople = 4;

const charity = totalGoldCoins % numberOfPeople
console.log(charity);
</solution>
</codeblock>

Following up from the previous questions, later they decided to give 1 more coin to charity.
Using the correct operator, increase the `charity` variable value by 1 and print it to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const charity = 3;
// Write your code here
</code>
<solution>
let charity = 3;
charity += 1;
console.log(charity);
</solution>
</codeblock>
