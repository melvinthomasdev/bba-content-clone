Create an variable `results`
which is an object.
Properties of this object are
described below:

| Key                 | Value |
| ------------------- | ----- |
| "history"           | 61    |
| "geography"         | 49    |
| "science-physics"   | 78    |
| "science-chemistry" | 88    |
| "math-geometry"     | 51    |
| "math-algebra"      | 65    |

Read the value of the `math-geometry`,
and `math-algebra` property
from the `results` object
using the **bracket notation**
and log it to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>
<solution>
const results = {
  "history": 61,
  "geography": 49,
  "science-physics": 78,
  "science-chemistry": 88,
  "math-geometry": 51,
  "math-algebra": 65
};

console.log(results["math-geometry"]);
console.log(results["math-algebra"]);
</solution>
</codeblock>
