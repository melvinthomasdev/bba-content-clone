Deep copy all the properties of the `bird` object
into the `birdCopy` object.
`bird.features` and `birdCopy.features`
should not be shallow copied.

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

const birdCopy = ;

console.log(birdCopy);
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

const birdCopy = JSON.parse(JSON.stringify(bird));

console.log(birdCopy);
</solution>
</codeblock>
