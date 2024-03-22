Sam, the owner of a bustling fruit
and
vegetable farm, handed Eve,
his trusted assistant,
with an object containing separate
arrays of fruit
and
vegetable names to be arranged
on the stand.

Initially, she decided to separate
the arrays of fruit
and
vegetable names from the object
into separate arrays.

Additionally, she decided that sorting
them alphabetically will look good.

We have the object Sam handed Eve,
create a program to display the following:

```
Sorted Fruits: [ 'apple', 'banana', 'grape', 'kiwi', 'orange', 'pineapple', 'strawberry' ]
Sorted Vegetables: [ 'broccoli', 'carrot', 'cucumber', 'potato', 'spinach', 'tomato' ]
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const itemsObject = {
  fruits: "apple, banana, orange, grape, kiwi, pineapple, strawberry",
  vegetables: "carrot, potato, tomato, broccoli, spinach, cucumber"
};

// Write code below this line
</code>
<solution>
const itemsObject = {
  fruits: "apple, banana, orange, grape, kiwi, pineapple, strawberry",
  vegetables: "carrot, potato, tomato, broccoli, spinach, cucumber"
};

// Write code below this line
const fruitsArray = Array.from(itemsObject.fruits.split(','));
const vegetablesArray = Array.from(itemsObject.vegetables.split(','));

// Sort the arrays of fruits and vegetables alphabetically using Array.from()
const sortedFruits = Array.from(fruitsArray).sort();
const sortedVegetables = Array.from(vegetablesArray).sort();

// Display the sorted arrays
console.log("Sorted Fruits:", sortedFruits);
console.log("Sorted Vegetables:", sortedVegetables);
</solution>
</codeblock>
