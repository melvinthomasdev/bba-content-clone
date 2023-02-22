- Given is an array of objects, where each object stores details of a wedding guest.
```
[
  {
    "name": "Sam",
    "age": "42",
    "meal-preference": "veg"
  },
  {
    "name": "Patrice",
    "age": "35",
    "meal-preference": "non-veg"
  },
  {
    "name": "John",
    "age": "28",
    "meal-preference": "veg"
  },
  {
    "name": "Jack",
    "age": "55",
    "meal-preference": "mixed"
  },
  {
    "name": "Harry",
    "age": "64",
    "meal-preference": "non-veg"
  },
  {
    "name": "Juliet",
    "age": "23",
    "meal-preference": "mixed"
  }
]
```
- Print `X will have veg meal.`, for the guest who prefers veg.
- Print `Y will have steak.`, for the guest who prefers non-veg.
- Print `Z will have a combo meal.`, for those who prefer mixed meal.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
</code>

<solution>
const guestList = [
  {
    "name": "Sam",
    "age": "42",
    "meal-preference": "veg"
  },
  {
    "name": "Patrice",
    "age": "35",
    "meal-preference": "non-veg"
  },
  {
    "name": "John",
    "age": "28",
    "meal-preference": "veg"
  },
  {
    "name": "Jack",
    "age": "55",
    "meal-preference": "mixed"
  },
  {
    "name": "Harry",
    "age": "64",
    "meal-preference": "non-veg"
  },
  {
    "name": "Juliet",
    "age": "23",
    "meal-preference": "mixed"
  }
]
<!-- Using for..of loop -->
for(const guest of guestList){
  const mealPreference = guest["meal-preference"];
  <!-- Using switch statement -->
  switch(mealPreference){
    case "mixed":
      console.log(`${guest["name"]} will have a combo meal.`);
      break;
    case "non-veg":
      console.log(`${guest["name"]} will have steak.`);
      break;
    default:
      console.log(`${guest["name"]} will have veg meal.`);
      break;
  }
}
</solution>
</codeblock>
