There are two objects **smallBird** and **largeBird**.
Assign the value of `this` such that once
it represents the **smallBird** object
and
the second time, it represents
the **largeBird** object.

Use the `console.log` statement to
show the message with the
correct bird name.

<Editor type="exercise" lang="javascript">
<code>
let smallBird = { name: "Sparrow" };
let largeBird = { name: "Eagle" };

function birdName() {
  console.log(`I am ...`);
}

smallBird.message = ;
largeBird.message = ;

smallBird.message();
largeBird.message();
</code>

<solution>
let smallBird = { name: "Sparrow" };
let largeBird = { name: "Eagle" };

function birdName() {
  console.log(`I am ${this.name}`);
}

smallBird.message = birdName;
largeBird.message = birdName;

smallBird.message();
largeBird.message();
</solution>
</Editor>