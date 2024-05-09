Define a function `hasDuplicates()`
that takes an array `arr` as input.

Inside the function, iterate over each
element in the array
and
check if there exists another element
in the array that is equal to the current element,
**excluding** itself.

If such a duplicate element is found, return **true**.
If no duplicate elements are found after iterating
over the entire array, return **false**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const array1 = [1, 2, 3, 4, 5, 3];
const array2 = ["apple", "banana", "orange", "apple"];
const array3 = [1, 2, 3, 4, 5];

// Write code below this line

console.log(hasDuplicates(array1));
console.log(hasDuplicates(array2));
console.log(hasDuplicates(array3));
</code>
<solution>
const array1 = [1, 2, 3, 4, 5, 3];
const array2 = ["apple", "banana", "orange", "apple"];
const array3 = [1, 2, 3, 4, 5];

// Write code below this line
const hasDuplicates = (arr) => {
  return arr.some((element, index) => {
    return arr.some((otherElement, otherIndex) => {
      return otherIndex !== index && otherElement === element;
    });
  });
};

console.log(hasDuplicates(array1));
console.log(hasDuplicates(array2));
console.log(hasDuplicates(array3));
</solution>
</codeblock>
