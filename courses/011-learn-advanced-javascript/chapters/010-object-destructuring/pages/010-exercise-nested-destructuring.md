The object `house` has
the object `details`
nested inside it.

Use object destructuring
to extract the properties
`roof` and `walls` from
the object `details`.

<Editor type="exercise" lang="javascript">
<code>
let house = {
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
let house = {
  details: {
    roof: "Clay tiles",
    walls: "Brick"
  },
  available: true
}

let {
  details: {
    roof,
    walls
  },
  available
} = house

console.log(roof);
console.log(walls);
</solution>
</Editor>