Copy the object stored in the **bird** variable to
the **newBird** variable.
Use the **newBird** variable to
change the **name** property to **Eagle**.

Use `console.log()` to
show the value of the **name** property.

<Editor type="exercise" lang="javascript">
<code>
let bird = { name: "Sparrow" };
let newBird = ;
console.log(bird.name);
</code>

<solution>
let bird = { name: "Sparrow" };
let newBird = bird;
newBird.name = "Eagle";
console.log(bird.name);
</solution>
</Editor>