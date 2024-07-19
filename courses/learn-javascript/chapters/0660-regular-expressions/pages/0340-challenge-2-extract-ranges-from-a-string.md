Create a function called `extractRanges`
that takes a string containing ranges
of numbers as input
and returns an array of arrays, where
each sub-array represents a range of numbers.

If a single number is present without a range,
it should be returned as a single-element array.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below

console.log(extractRanges("1-5, 8-10, 15"));
console.log(extractRanges("3-4, 7, 12-15"));
console.log(extractRanges("5, 10-12"));
console.log(extractRanges(""));
</code>
<solution>
const extractRanges = (inputString) => {
  const regex = /\d+-\d+|\d+/;
  const matches = inputString.match(regex);
  if (!matches) return [];

  return matches.map(range => {
    if (range.includes('-')) {
      // If the range is in the format "start-end"
      const [start, end] = range.split('-').map(Number);
      return Array.from({ length: end - start + 1 }, (_, i) => start + i);
    } else {
      return [Number(range)];
    }
  });
};

console.log(extractRanges("1-5, 8-10, 15"));
console.log(extractRanges("3-4, 7, 12-15"));
console.log(extractRanges("5, 10-12"));
console.log(extractRanges(""));
</solution>
</codeblock>
