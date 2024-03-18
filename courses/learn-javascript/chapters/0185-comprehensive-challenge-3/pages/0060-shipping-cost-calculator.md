Update the function **calculateShippingCostIndia** to calculate the shipping cost for packages sent to destinations within India. The function should consider the weight of the package and the destination state to determine the shipping cost.

The function parameters are,

- **weight (number):** It represents the weight of the package in kilograms. 
- **destination (string):** It represents the destination state within India.

The shipping cost is calculated based on the following criteria,

- For all destinations in India, the base shipping cost is ₹50.
- Additionally, there is an extra charge of ₹10 per kilogram for packages weighing more than 5 kilograms.

The function should return a string indicating the shipping cost based on the weight and destination,

- If the weight of the package is 5 kilograms or less, the function should return **"Shipping cost is ₹X"**, where X is the total shipping cost.
- If the weight of the package exceeds 5 kilograms, the function should return **"Shipping cost is ₹Y"**, where Y is the total shipping cost including the additional charge for weight above 5 kilograms.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const calculateShippingCostIndia = (weight, destination) => {
    // write your code here
}
</code>

<solution>
const calculateShippingCostIndia = (weight, destination) => {
   const baseCost = 50;
   let totalCost;

    if (weight <= 5) {
        totalCost = baseCost;
    } else {
        const extraWeight = weight - 5;
        totalCost = baseCost + (extraWeight * 10);
    }

    return `Shipping cost is ₹${totalCost}`;
}

</solution>
<testcases>
<caller>
console.log(calculateShippingCostIndia(weight, destination));
</caller>
<testcase>
<i>
const weight = 9;
const destination = "Maharashtra";
</i>
</testcase>
<testcase>
<i>
const weight = 7;
const destination = "Kerala";
</i>
</testcase>
<testcase>
<i>
const weight = 7;
const destination = "Goa";
</i>
</testcase>
<testcase>
<i>
const weight = 10
const destination = "Tamil Nadu";
</i>
</testcase>
</testcases>
</codeblock>
