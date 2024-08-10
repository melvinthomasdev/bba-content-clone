Rest Operator collects values
into a single value. On the other hand,
a spread operator expands the values of
an iterable into parts.

<codeblock language="javascript" type="lesson">
<code>
const mergeAndSum = (firstArray, ...otherArrays) => {
  const combinedArray = [firstArray, ...otherArrays].flat();
  return combinedArray.reduce((sum, number) => sum + number, 0);
}

const totalSum = mergeAndSum([1, 2], [3, 4], [5, 6]);
console.log(totalSum);

</code>
</codeblock>

Here, the rest operator, is a function parameter
that collects all additional arrays passed to
**mergeAndSum** into a single array.

The spread operator combines the **firstArray**
with the collected **otherArrays**
into a single array.