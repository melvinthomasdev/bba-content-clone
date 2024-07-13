A chemist creates a function **isAlcohol**
to determine whether an organic compound is
alcohol or not by checking if its name ends
with **nol**.
Display **true** if it is alcohol, and **false** otherwise.

For example:
```js
Input: compound = "Polythene"

Output: false
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const compound1 = "Ethanol";
const compound2 = "Propanol";
const compound3 = "Methane";
const compound4 = "Benzene";
const compound5 = "Hexanol";

function isAlcohol (compound) {
  // Your code here

}

console.log(isAlcohol(compound1));
console.log(isAlcohol(compound2));
console.log(isAlcohol(compound3));
console.log(isAlcohol(compound4));
console.log(isAlcohol(compound5));
</code>

<solution>
const compound1 = "Ethanol";
const compound2 = "Propanol";
const compound3 = "Methane";
const compound4 = "Benzene";
const compound5 = "Hexanol";

function isAlcohol (compound) {
  // Your code here
  return compound.endsWith("nol");
}

console.log(isAlcohol(compound1));
console.log(isAlcohol(compound2));
console.log(isAlcohol(compound3));
console.log(isAlcohol(compound4));
console.log(isAlcohol(compound5));
</solution>
</codeblock>
