The `add()` method can be used to add
a value to the end of a `Set`.

<codeblock language="javascript" type="lesson">
<code>
const truthyValues = new Set(["apple", 1234, true]);

truthyValues.add(56.78);
truthyValues.add("apple");

console.log(truthyValues);
</code>
</codeblock>

In the example given above:

- `truthyValues.add(56.78)` adds the element `56.78`
  to the end of the set `truthyValues`.

- `truthyValues.add("apple")` should add the element `"apple"`
  to the end of the set `truthyValues`.
  However, `truthyValues` already has an element
  with the value `"apple"`.
  Hence the element `"apple"` is not added to `truthyValues`.
