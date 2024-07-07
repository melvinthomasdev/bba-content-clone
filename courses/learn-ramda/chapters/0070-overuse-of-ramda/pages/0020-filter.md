Consider the following example, we need to filter the `tags` array based on the condition that its names are not present in the `excludedList`.
```js
const tags = [
  { id: 1, name: "high-priority" },
  { id: 2, name: "bug" },
  { id: 3, name: "triaged" },
  { id: 4, name: "todo" },
];
const excludedList = ["feature", "todo", "on-hold"];
```

In vanilla JavaScript we would write it as follows:
```js
const filteredTags = tags.filter(tag => !excludedList.includes(tag.name));
```
This is readable, but since we learned Ramda we may decide to use it to make the code better. Let's see how.
```js
const filteredTags = filter(
  pipe(prop("name"), includes(__, excludedList), not),
  tags
);
```
We had to create a pipe that first extracts the name prop, checks if it is present in the excluded list and then returns the complement of that result. This pipe has to be passed into the `filter` function to achieve the desired result.

As can be seen, a pure Ramda solution makes the code more unreadable. We may be able to use a mix of Ramda and vanilla JavaScript to make it better. But at this point, we are doing extra work for not much return. The JavaScript code as-is is readable and we can continue using that.

Let's look at another example where we can use Ramda in a readable manner without overusing it. Consider the following `cars` array. We need to filter only the cars that have a "road legal" variant. Let's see the Ramda code:
```js
const cars = [
  {
    id: 1,
    name: "Ferrari 458",
    variants: [
      { type: "sport", name: "Italia" },
      { type: "sport", name: "Spider" },
      { type: "sport", name: "Speciale" },
    ],
  },
  {
    id: 2,
    name: "Aston Martin",
    variants: [
      { type: "sport", name: "DB5" },
      { type: "sport", name: "DB7" },
      { type: "sport", name: "DB9" },
    ],
  },
  {
    id: 3,
    name: "Audi Etron",
    variants: [
      { type: "sport", name: "GT" },
      { type: "road legal", name: "Sportback" },
    ],
  },
  {
    id: 4,
    name: "Bentley Continental",
    variants: [
      { type: "sport", name: "GT" },
      { type: "road legal", name: "Supersports" },
    ],
  },
];

const filteredCars = filter(
  propSatisfies(any(propEq("road legal", "type")), "variants"),
  cars
);
/*
[
  {
    "id": 3,
    "name": "Audi Etron",
    "variants": [
      { "name": "GT", "type": "sport" },
      { "name": "Sportback", "type": "road legal" }
    ]
  },
  {
    "id": 4,
    "name": "Bentley Continental",
    "variants": [
      {" name": "GT", "type": "sport" },
      {" name": "Supersports", "type": "road legal" }
    ]
  },
]
*/
```

It's not very easy to understand this code. Let's break it down. `filter` iterates through the `cars` array and checks whether the property `variants` satisfies the given condition which is, `type` property of any one of the variants should be "road legal". Only the cars which match this filter condition are returned.

Let us try to write it in vanilla JavaScript as follows:
```js
// Output same as above
const filteredCars = cars.filter(car =>
  car.variants.some(variant => variant.type === "road legal")
);
```

This is readable and we can understand the code easily. But it has become too long and verbose. Let's see how we can mix any Ramda function into the above code to increase readability and make it shorter.

```js
// Output same as above
const filteredCars = cars.filter(car =>
  car.variants.some(propEq("road legal", "type"))
);
```

The code is not too verbose now, nor is it unreadable. We have used a mix of Ramda and vanilla JavaScript to write compact and readable code.
