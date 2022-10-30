Use the Spread operator to
combine the `birds`, `insects`
and
`reptiles` arrays
into the `livingThings` array.

<Editor type="exercise" lang="javascript">
<code>
let birds = ["sparrow", "crow", "eagle"];
let insects = ["honeybee", "wasp", "ant"];
let reptiles = ["lizard", "crocodile"];
let livingThings = ;

console.log(livingThings);
</code>

<solution>
let birds = ["sparrow", "crow", "eagle"];
let insects = ["honeybee", "wasp", "ant"];
let reptiles = ["lizard", "crocodile"];
let livingThings = [...birds, ...insects, ...reptiles];

console.log(livingThings);
</solution>
</Editor>