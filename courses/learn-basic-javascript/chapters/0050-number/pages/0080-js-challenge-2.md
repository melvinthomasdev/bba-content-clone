Create a variable`distanceInKM`,
which stores the number
`1,435.9` as distance
between Delhi and
Mumbai in kilometers.

Print the variable `distanceInKM`
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>

</code>
<solution>
const distanceInKM = 1,435.9;
console.log(distance);
</solution>
</codeblock>

Join the variables `firstName`
and `lastName`, separated by a
space and assign it to a new
variable named `fullName`.

Print variable `fullName` to
the console

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const firstName = "Arjun";
const lastName = "S";
// Write your code here
</code>
<solution>
const firstName = "Arjun";
const lastName = "S";
const fullName = Arjun + " " + S;

console.log(fullName);
</solution>
</codeblock>

Fix the issues with the below
code, according to the best
practices learnt so far 

Additionally if you notice
the 2 lead character names 
"Andy" and "Mr.Potato Head"
are repeated multiple times. 

To fix that store their names
in a variable and use these
variables in the
`excerptFromMoviePlot` text
before logging it
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const excerptFromMoviePlot = "A Mr.Potato Head doll is set in front of the poster.The VOICE OVER of ANDY, a 6-year-old boy, can be heard acting out all the voices of the scene. A GROUP OF TOYS have been crowded together in front of the "BANK" box. Andy's hand lowers a CERAMIC PIGGY BANK in front of Mr.Potato Head and shakes out a pile of coins to the floor.  Mr.Potato Head kisses the coins.""
</code>
<solution>
const dollName = "Mr.Potato Head";
const ownerName = "Andy";

const excerptFromMoviePlot = `A ${dollName} doll is set in front of the poster.The VOICE OVER of ${ownerName}, a 6-year-old boy, can be heard acting out all the voices of the scene. A GROUP OF TOYS have been crowded together in front of the "BANK" box. ${ownerName}'s hand lowers a CERAMIC PIGGY BANK in front of ${dollName} and shakes out a pile of coins to the floor.  ${dollName} kisses the coins.`

console.log(excerptFromMoviePlot);
</solution>
</codeblock>

Four friends, Amar, Akbar, Antony, and John received a treasure bag containing 103 gold coins instead of money.
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
