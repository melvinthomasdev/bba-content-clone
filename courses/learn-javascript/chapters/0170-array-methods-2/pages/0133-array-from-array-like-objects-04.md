In `Array.from()`, when we pass
an object with a length property
and indexed values, we still need
to be aware of something like this:

<codeblock language="javascript" type="lesson">
<code>
const oceans = {
  0: 'Pacific Ocean',
  1: 'Atlantic Ocean',
  8: 'Indian Ocean',
  9: 'Antarctic Ocean',
  4: 'Arctic Ocean',
  length: 5
};

const oceansArray = Array.from(oceans);
console.log(oceansArray);
</code>
</codeblock>

Remember that JavaScript will create
an array of length specified in
our object. So, if there are
no keys that help fill the indexes
of the array, in those places
JavaScript will insert `undefined`.

Since, in our object above, we
didn't provide keys **2** and
**3**, JavaScript inserted `undefined`
in those locations in the array.

Also notice that all other values
that are beyond the length of
the array are discarded. So, `Indian Ocean`
and `Southern Ocean` do not
have a place in `oceansArray`.