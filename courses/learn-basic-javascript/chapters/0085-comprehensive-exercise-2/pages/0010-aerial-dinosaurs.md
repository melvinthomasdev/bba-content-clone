We know the aerial dinosaurs survived extinction. Today we call them birds. Given below are two data sets of a number of birds.
- `birdList` gives a list of birds with a few additional properties.
- `birdType` gives the type of the birds listed in birdList data set in order same as `birdList`.
```
birdType = ["Aerial", "Aquatic", "Aerial", "Terrestrial", "Terrestrial", "Aquatic"];
birdList = [
  {
  "name": "Kingfisher",
  "Can-fly": true,
  "number-of-claws": 4
  },
  {
  "name": "Penguin",
  "Can-fly": false,
  "number-of-claws": 3
  },
  {
  "name": "Eagle",
  "Can-fly": true,
  "number-of-claws": 4
  },
  {
  "name": "Chicken",
  "Can-fly": false,
  "number-of-claws": 5
  },
  {
  "name": "Turkey",
  "Can-fly": false,
  "number-of-claws": 3
  },
  {
  "name": "Duck",
  "Can-fly": false,
  "number-of-claws": 4
  }
]
```
## We need to: 
1. Update the values in `birdList` to include a `type` property with value added from `birdType` list.
2. Display a list of all the details of only the birds that can fly from `birdList` data.

## Example:

<img src="birdList-exercise.png" alt="Bird-list exercise">

Expected output for the above example:
```
Details of all the birds that can fly are :
0: ['name', 'Sparrow']
1: ['Can-fly', true]
2: ['number-of-claws', 4]
3: ['type', 'Aerial']
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
//Write code here
</code>
<solution>

const birdType = ["Aerial", "Aquatic", "Aerial", "Terrestrial", "Terrestrial", "Aquatic"];
const birdList = [
 {
 "name": "Kingfisher",
 "Can-fly": true,
 "number-of-claws": 4,
 "type": birdType[0]
 },
 {
 "name": "Penguin",
 "Can-fly": false,
 "number-of-claws": 4,
 "type": birdType[1]
 },
 {
 "name": "Eagle",
 "Can-fly": true,
 "number-of-claws": 4,
 "type": birdType[2]
 },
 {
 "name": "Chicken",
 "Can-fly": false,
 "number-of-claws": 4,
 "type": birdType[3]
 },
 {
 "name": "Turkey",
 "Can-fly": false,
 "number-of-claws": 4,
 "type": birdType[4]
 },
 {
 "name": "Duck",
 "Can-fly": false,
 "number-of-claws": 4,
 "type": birdType[5]
 }
];
console.log("Details of all the birds that can fly are :", Object.entries(birdList[0]), Object.entries(birdList[2])`);
</solution>
</codeblock>
