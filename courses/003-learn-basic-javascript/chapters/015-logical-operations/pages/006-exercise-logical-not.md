Use `!` in the `if` condition
such that the code given in the editor
welcomes only `Oliver`.

For all others the code displays the message
`Who are you?`.

<Editor lang="javascript" type="exercise">
<code>
let personName = "Oliver";

if (personName == "Oliver") {

  console.log(`Who are you?`);

} else {

  console.log(`Welcome Oliver.`);

}
</code>

<solution>
let personName = "Oliver";

if (!(personName == "Oliver")) {

  console.log(`Who are you?`);

} else {

  console.log(`Welcome Oliver.`);

}
</solution>
</Editor>