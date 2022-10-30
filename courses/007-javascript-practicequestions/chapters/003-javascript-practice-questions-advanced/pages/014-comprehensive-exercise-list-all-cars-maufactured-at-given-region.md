List all cars that are manufactured in the given region.

1. Find all the cars that are manufactured in the given region.
2. You will be given the list of manufacturers with their region and list of car names.
3. Filter the manufacturers of the given region and display the cars manufactured by them.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getCarsByRegion(manufactures, region){
  // write your code here
}
</code>

<solution>
function getCarsByRegion(manufacturers, region){
  const manufacturersOfRegion = manufacturers.filter((manufacturer) => {
    return manufacturer.region === region;
  });
  const carsOfRegion = manufacturersOfRegion.reduce((carsOfRegion, manufacturer) => {
    carsOfRegion = carsOfRegion.concat(manufacturer.cars);
    return carsOfRegion;
  }, []);
  return carsOfRegion;
}
</solution>

<testcases>
<caller>
const cars = getCarsByRegion(manufacturers, region);
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
  }
];
</i>
</testcase>
</testcases>
</Editor>