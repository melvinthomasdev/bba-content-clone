Update the provided code to
perform the following actions:

- Save the heading with id `welcome`
  in a variable named `mainHeading`.
- Save the heading with id `punchline`
  in a variable named `punchline`.
- Save all the `h2` tags in a variable
  named `headings` as an Array.
- Log `mainHeading`, `punchline` and
  `headings` to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<h1>Quotes</h1>
<div class="page">
  <h2 id="welcome">Welcomes are hard too!</h2>
  <h2 id="punchline">Punchlines are sweet!</h2>
</div>
</panel>
<panel language="javascript">
let mainHeading = "";
let punchline = "";
let headings = "";

</panel>
</code>
<solution>
let mainHeading = document.getElementById('welcome');
let punchline = document.getElementById('punchline');
let allHeadings = Array.from(document.getElementsByTagName('h2'));

console.log(mainHeading);
console.log(punchline);
console.log(allHeadings);

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
