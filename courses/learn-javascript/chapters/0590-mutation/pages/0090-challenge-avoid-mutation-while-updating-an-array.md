In the code below,
the `forEach` method is used to
convert the sizes in the `sizesInCentimeters` array
to its equivalent size in `meters`.

This is bad code since,
it not only mutates the `sizesInCentimeters` array
but the name **"sizesInCentimeters"**
does not make sense after
the values have been converted to meters.

Rewrite this code to create
a new array `sizesInMeters`
that contains values from
the `sizesInCentimeters` array
after dividing them by `100`.

Use `console.log()` to display both
`sizesInCentimeters` and `sizesInMeters` arrays.

For example:
```js
Input: sizesInCentimeters = [18000, 2500, 6000]
Output: [180, 25, 60]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const sizesInCentimeters = [24000, 3200, 5000];

sizesInCentimeters.forEach((size, index) => sizesInCentimeters[index] = size / 100);
console.log(sizesInCentimeters);
</code>

<solution>
const sizesInCentimeters = [24000, 3200, 5000];

const sizesInMeters = sizesInCentimeters.map(size => size / 100);

console.log(sizesInCentimeters);
console.log(sizesInMeters);
</solution>
</codeblock>
