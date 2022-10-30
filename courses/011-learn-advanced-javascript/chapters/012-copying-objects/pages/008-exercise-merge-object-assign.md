Use the `Object.assign` method to merge
the objects **canBirdFly**
and
**numberOfClaws** into the **bird** object.

<Editor type="exercise" lang="javascript">
<code>
let bird = { name: "Sparrow" };
let canBirdFly = { canFly: true };
let numberOfClaws = { claws: 4 };
Object.assign();
console.log(bird);
</code>

<solution>
let bird = { name: "Sparrow" };
let canBirdFly = { canFly: true };
let numberOfClaws = {claws: 4};
Object.assign(bird, canBirdFly, numberOfClaws);
console.log(bird);
</solution>
</Editor>