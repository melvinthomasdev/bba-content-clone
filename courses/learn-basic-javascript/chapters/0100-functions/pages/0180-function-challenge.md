Write a function **displayTeamMembers**
that prints all the team
members' names one by
one on the console.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
</code>

<solution>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const displayTeamMembers = () => {
  teamMembers.forEach(teamMember => {
    console.log(teamMember);
  })
}
</solution>
</codeblock>

Change the same function
to print all the pets'
names one by one on the console.
Ensure that your function
**displayTeamMembers** can
take any array and print its values
one by one on the screen.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
</code>

<solution>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
const displayTeamMembers = (group) => {
  group.forEach(groupMember => {
    console.log(groupMember);
  })
}
</solution>
</codeblock>

Create a new function named **sumGroups**
that adds the total number
of **pets** and **teamMembers**. Run the
function and save the result
in the **total** variable.
Print this variable on the screen.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
const total = 0;

// Write your code below this line
</code>

<solution>
const teamMembers = ["Ajith", "Vaishnavi", "Nilopher", "Ritika", "Shristi", "Manjunath"];
const pets = ["dog", "fish", "parrot", "tortoise", "lizard", "cat"];
let total = 0;

// Write your code below this line

const sumGroups = () => {
  return teamMembers.length + pets.length;
}
total = sumGroups();
console.log(total);
</solution>
</codeblock>