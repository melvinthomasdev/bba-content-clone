List all cars that are manufactured in the given region.

1. Find all the cars that are manufactured in the given region.
2. You will be given the list of manufacturers with their region and list of car names.
3. Filter the manufacturers of the given region and display the cars manufactured by them.

For example:
```js
Input:
region = "Europe";
manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"]
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"]
  },
  {
    name: "PSA Peugeot-Citroën",
    region: "Europe",
    cars: ["Peugeot 504", "Citroën GS", "Citroën CX", "Simca 1307-08", "Simca Horizon"]
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"]
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"]
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"]
  },
  {
  name: "Holden",
  region: "Australia",
  cars: ["Commodore", "Astra", "Colorado", "Trailblazer"]
  }
];

Output:
[
  "Peugeot 504",
  "Citroën GS",
  "Citroën CX",
  "Simca 1307-08",
  "Simca Horizon",
  "Alfa Romeo",
  "Pacifica",
  "Fiat 500X",
  "Fiat Egea"
]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getCarsByRegion = ({ manufacturers, region }) =>
  // write your code here
</code>

<solution>
const getCarsByRegion = ({ manufacturers, region }) =>
  manufacturers
    .filter(manufacturer => manufacturer.region === region)
    .reduce((cars, manufacturer) => [...cars, ...manufacturer.cars], []);
</solution>

<testcases>
<caller>
const cars = getCarsByRegion({ manufacturers, region });
console.log(JSON.stringify(cars, null, 2));
</caller>
<testcase>
<i>
const region = "USA";
const manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"]
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"]
  },
  {
    name: "PSA Peugeot-Citroën",
    region: "Europe",
    cars: ["Peugeot 504", "Citroën GS", "Citroën CX", "Simca 1307-08", "Simca Horizon"]
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"]
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"]
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"]
  },
  {
  name: "Holden",
  region: "Australia",
  cars: ["Commodore", "Astra", "Colorado", "Trailblazer"]
  }
];
</i>
</testcase>
<testcase>
<i>
const region = "Asia";
const manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"]
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"]
  },
  {
    name: "PSA Peugeot-Citroën",
    region: "Europe",
    cars: ["Peugeot 504", "Citroën GS", "Citroën CX", "Simca 1307-08", "Simca Horizon"]
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"]
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"]
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"]
  },
  {
  name: "Holden",
  region: "Australia",
  cars: ["Commodore", "Astra", "Colorado", "Trailblazer"]
  }
];
</i>
</testcase>
<testcase>
<i>
const region = "Europe";
const manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"]
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"]
  },
  {
    name: "PSA Peugeot-Citroën",
    region: "Europe",
    cars: ["Peugeot 504", "Citroën GS", "Citroën CX", "Simca 1307-08", "Simca Horizon"]
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"]
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"]
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"]
  },
  {
  name: "Holden",
  region: "Australia",
  cars: ["Commodore", "Astra", "Colorado", "Trailblazer"]
  }
];
</i>
</testcase>
<testcase>
<i>
const region = "Australia";
const manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"]
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"]
  },
  {
    name: "PSA Peugeot-Citroën",
    region: "Europe",
    cars: ["Peugeot 504", "Citroën GS", "Citroën CX", "Simca 1307-08", "Simca Horizon"]
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"]
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"]
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"]
  },
  {
  name: "Holden",
  region: "Australia",
  cars: ["Commodore", "Astra", "Colorado", "Trailblazer"]
  }
];
</i>
</testcase>
</testcases>
</codeblock>
