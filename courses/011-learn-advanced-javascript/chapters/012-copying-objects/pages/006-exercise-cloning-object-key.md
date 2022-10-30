Create a clone of the object **bird**.
Use the **birdClone** variable
to store the cloned object.

Use the `console.log` statement to
show the **birdClone** object.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  canFly: true,
  claws: 4
};

let birdClone = {};

for() {

}

console.log(birdClone);
</code>

<solution>
let bird = {
  name: "Sparrow",
  canFly: true,
  claws: 4
};

let birdClone = {};

for(let i in bird) {
  birdClone[i] = bird[i];
}

console.log(birdClone);
</solution>
</Editor>