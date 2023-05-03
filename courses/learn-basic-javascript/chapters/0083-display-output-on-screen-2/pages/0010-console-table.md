In order to visualise array or object data better in the console, we can use `console.table`. It outputs data in a table format on the **console** of a **web browser**.

Run the below code snippet to see how `console.table` works and its difference to `console.log`:

<codeblock language="javascript" type="lesson">
<code>
const fruits = ['Apple', 'Orange', 'Pineapple'];
console.log(fruits);
console.table(fruits);

const car = {
    name: "Tata Nexon",
    manufacturer: "Tata",
	countryOfOrigin: "India",
};
console.log(car);
console.table(car);
</code>
</codeblock>
