`toString()` is a built-in
JavaScript method used to
convert values into string.

Let us take a look at an example:
<codeblock language="javascript" type="lesson">
<code>
const number = 42;
const boolean = true;
const array = [1, 2, 3];

console.log(number.toString()); // "42"
console.log(boolean.toString()); // "true"
console.log(array.toString());  // "1,2,3"
</code>
</codeblock>

In addition to `toString()`,
JavaScript provides the `String()` function,
which serves a similar purpose.

The main difference lies in how you use them:
- `toString()` is called on
an existing value.
For example - a number, boolean,
or object with a custom toString method.

It converts that specific value into a string.

- `String()` is a function to which
you can pass any value as a parameter,
and
it will transform that value into a string.

Here's an example of using `String()`:
<codeblock language="javascript" type="lesson">
<code>
const numberAsString = String(42);
const booleanAsString = String(true);
const arrayAsString = String([1, 2, 3]);

console.log(numberAsString); // Output = "42"
console.log(booleanAsString); // Output = "true"
console.log(arrayAsString);  // Output = "1,2,3"

// Using the String() method for `null` and `undefined`
console.log(String(null));
console.log(String(undefined));
</code>
</codeblock>

While both `toString()`
and
`String()` can be used to convert
values to strings,
`String()` is more versatile.

`toString()` method has a few limitations,
we will cover those in the coming lessons.
