Finish the method definition below.

`manufacturers` is an array of hashes, each hash representing a car manufacturer, with three keys "name", "region", and "cars". "cars" itself is an array of strings, each string representing a car model.

Given `manufacturers` and a `region`, the method should filter the manufacturers to only those that are made in the given region, and return the array of `cars` for each manufacturer.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def cars_by_region(manufacturers, region)
  # write your code here
end
</code>

<solution>
def cars_by_region(manufacturers, region)
  manufacturers.select { |manufacturer| manufacturer[:region] == region }
    .map { |manufacturer| manufacturer[:cars] }
end
</solution>

<testcases>
<caller>
puts cars_by_region(manufacturers, region)
</caller>
<testcase>
<i>
manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"],
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"],
  },
  {
    name: "PSA Peugeot-Citroen",
    region: "Europe",
    cars: ["Peugeot 504", "Citroen GS", "Citroen CX", "Simca 1307-08", "Simca Horizon"],
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"],
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"],
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"],
  },
]
region = "USA"
</i>
</testcase>
<testcase>
<i>
manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"],
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"],
  },
  {
    name: "PSA Peugeot-Citroen",
    region: "Europe",
    cars: ["Peugeot 504", "Citroen GS", "Citroen CX", "Simca 1307-08", "Simca Horizon"],
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"],
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"],
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"],
  },
]
region = "Asia"
</i>
</testcase>
<testcase>
<i>
manufacturers = [
  {
    name: "Ford",
    region: "USA",
    cars: ["Fusion", "EcoSport", "Explorer", "Ranger", "Edge", "Escape"],
  },
  {
    name: "Suzuki",
    region: "Asia",
    cars: ["Carry Truck", "Carry Dump Truck", "Jimny", "Landy"],
  },
  {
    name: "PSA Peugeot-Citroen",
    region: "Europe",
    cars: ["Peugeot 504", "Citroen GS", "Citroen CX", "Simca 1307-08", "Simca Horizon"],
  },
  {
    name: "Fiat-Chrysler",
    region: "Europe",
    cars: ["Alfa Romeo", "Pacifica", "Fiat 500X", "Fiat Egea"],
  },
  {
    name: "Honda",
    region: "Asia",
    cars: ["Civic", "Clarity", "CRV", "Freed", "S660", "Shuttle", "Legend"],
  },
  {
    name: "Jeep",
    region: "USA",
    cars: ["Waggoneer", "Wrangler", "Cherokee", "Compass", "Renegade", "Gladiator"],
  },
]
region = "Europe"
</i>
</testcase>
</testcases>
</codeblock>
