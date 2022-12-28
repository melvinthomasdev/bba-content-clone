The `abilities` property of `bird`
is set as `null` in the code given below.
Hence we get an error when
trying to access `bird.abilities.canFly`.
Use optional chaining to make
the if condition work,
even if the value of `bird.abilities`
is `null` or `undefined`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Sparrow",
  abilities: null,
}

if (bird.abilities.canFly) {
  console.log(`The ${bird.name} can fly`);
} else {
  console.log(`The ${bird.name} cannot fly`);
}
</code>

<solution>
const bird = {
  name: "Sparrow",
  abilities: null,
}

if (bird.abilities?.canFly) {
  console.log(`The ${bird.name} can fly`);
} else {
  console.log(`The ${bird.name} cannot fly`);
}
</solution>
</codeblock>