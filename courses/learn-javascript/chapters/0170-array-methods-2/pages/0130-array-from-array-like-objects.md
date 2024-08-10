Take a look at this
example:

<codeblock language="javascript" type="lesson">
<code>
const continents = {
  0: 'Asia',
  1: 'Antarctica',
  2: 'Australia',
  3: 'Africa',
  4: 'North America',
  5: 'South America',
  6: 'Europe',
  length: 7
};

const continentsArray = Array.from(continents);
console.log(continentsArray);
</code>
</codeblock>

We can use `Array.from()` to create
an array from an object too. 