Follow the steps given below
to write a program:

1. Create an object **vehicles** that
stores the properties given in the table below:

    | Key | Value |
    | --- | ----- |
    | 1   | Car   |
    | 2   | Train |
    | 3   | Bus   |

2. Read all the values using **bracket notation**
and
show them using `console.log()`.

3. Then add the value **Boat** to
key **4** using **bracket notation**.

4. Finally show the `vehicles` object on
the console.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let vehicles = {
  1: "Car",
  2: "Train",
  3: "Bus"
};

console.log(vehicles[1]);
console.log(vehicles[2]);
console.log(vehicles[3]);

vehicles[4] = "Boat";

console.log(vehicles);
</solution>
</Editor>