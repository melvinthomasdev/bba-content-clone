The object `house` has
the object `details`
nested inside it.

Use object destructuring
to extract the properties
`roof` and `walls` from
the object `house.details`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const house = {
  details: {
    roof: "Clay tiles",
    walls: "Brick"
  },
  available: true
}

console.log(roof);
console.log(walls);
</code>

<solution>
const house = {
  details: {
    roof: "Clay tiles",
    walls: "Brick"
  },
  available: true
}

const {
  details: { roof, walls },
} = house

console.log(roof);
console.log(walls);
</solution>
</codeblock>