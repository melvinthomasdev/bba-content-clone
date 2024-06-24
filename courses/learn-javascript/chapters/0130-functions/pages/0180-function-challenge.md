Create a function named `displayTotalCount`
with two parameters:

- An array of strings.
- A new string element to be added to the list.

The displayTotalCount function should execute
the following tasks:
- Adds the string to the array.
- Display the total count of elements in the
  updated array by logging it to the console.
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const newTeamMember = "Peter";
// Write your code below this line

displayTotalCount(teamMembers, newTeamMember);
</code>

<solution>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const newTeamMember = "Peter";
// Write your code below this line
const displayTotalCount = (list, newElement) => {
  list.push(newElement);
  console.log(list.length);
};

displayTotalCount(teamMembers, newTeamMember);
</solution>
</codeblock>

Create a function `removeLastMember`
that takes an array of strings as a parameter.

The `removeLastMember` function should
perform the following steps:
- Removes the last element from the array.
- Display the updated array by logging
  it to the console.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
// Write your code below this line

removeLastMember(pets);
</code>

<solution>
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
// Write your code below this line
const removeLastMember = (list) => {
  list.pop();
  console.log(list);
};

removeLastMember(pets);
</solution>
</codeblock>

Create a new function named **calculateTotal**
that accepts two arrays as parameters
and logs to the console, the total number
of elements in both arrays.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
// Write your code below this line

calculateTotal(teamMembers, pets);
</code>

<solution>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
let total = 0;
// Write your code below this line

const calculateTotal = (firstArray, secondArray) => {
  console.log(firstArray.length + secondArray.length);
};
calculateTotal(teamMembers, pets);
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
