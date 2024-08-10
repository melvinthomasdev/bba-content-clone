When creating an array from an object,
the object needs to meet a few conditions.
Let's take a look at these.

First of all, this object should have a
length property. The length
property tells JavaScript
how long would the array be.

In the following object, we don't
have a length property:

<codeblock language="javascript" type="lesson">
<code>
const oceans = {
  0: 'Pacific Ocean',
  1: 'Atlantic Ocean',
  2: 'Indian Ocean',
  3: 'Antarctic Ocean',
  4: 'Arctic Ocean',
};

const oceansArray = Array.from(oceans);
console.log(oceansArray);
</code>
</codeblock>

In the next example, our object has
 a length property:

<codeblock language="javascript" type="lesson">
<code>
const oceans = {
  0: 'Pacific Ocean',
  1: 'Atlantic Ocean',
  2: 'Indian Ocean',
  3: 'Antarctic Ocean',
  4: 'Arctic Ocean',
  length: 5
};

const oceansArray = Array.from(oceans);
console.log(oceansArray);
</code>
</codeblock>