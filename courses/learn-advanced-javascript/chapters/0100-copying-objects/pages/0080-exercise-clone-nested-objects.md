Deep clone all the properties of the `bird` object
into the `birdClone` object.
`bird.features` and `birdClone.features`
should not be shallow clones.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Sparrow",
  features: {
    canFly: true,
    claws: 4
  },
  rare: false
};

const birdClone = ;

console.log(birdClone);
</code>

<solution>
const bird = {
  name: "Sparrow",
  features: {
    canFly: true,
    claws: 4
  },
  rare: false
};

const birdClone = JSON.parse(JSON.stringify(bird));

console.log(birdClone);
</solution>
</codeblock>