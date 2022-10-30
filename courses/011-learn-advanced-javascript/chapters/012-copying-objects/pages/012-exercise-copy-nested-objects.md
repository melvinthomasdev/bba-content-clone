Clone all the properties of the `bird` object
into the `birdClone` object. `bird.features` and
`birdClone.features` should hold the addresses of
two different objects.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  features: {
    canFly: true,
    claws: 4
  },
  rare: false
};

let birdClone = ;

console.log(birdClone);
</code>

<solution>
let bird = {
  name: "Sparrow",
  features: {
    canFly: true,
    claws: 4
  },
  rare: false
};

let birdClone = JSON.parse(JSON.stringify(bird));

console.log(birdClone);
</solution>
</Editor>