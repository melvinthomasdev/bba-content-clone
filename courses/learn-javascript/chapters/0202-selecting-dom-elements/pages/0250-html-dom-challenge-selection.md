Update the provided code to
perform the following actions:
- Save the heading with id `welcome`
  in a variable named `mainHeading`.
- Save the heading with id `punchline`
  in a variable named `punchline`.
- Save all the headings in a variable
  named `allHeadings`.
- Log `mainHeading`, `punchline` and
  `allHeadings` to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="page">
  <h2 id="welcome">Welcomes are hard too!</h2>
  <h2 id="punchline">Punchlines are sweet!</h2>
</div>
</panel>
<panel language="javascript">
let mainHeading = "";
let punchline = "";
let allHeadings = "";

</panel>
</code>
<solution>
let mainHeading = document.getElementById('welcome');
let punchline = document.getElementById('punchline');
let allHeadings = document.querySelectorAll('h2');

console.log(mainHeading);
console.log(punchline);
console.log(allHeadings);
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
