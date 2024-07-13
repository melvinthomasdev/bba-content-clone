`toString()` method cannot
be called directly on the values.
These values need to be assigned
to a variable and `toString()`
method should be called on that
variable.

The following code will result in an error:
<codeblock language="javascript" type="lesson">
<code>
console.log(42.toString()); 
console.log(true.toString());
console.log([1, 2, 3].toString());
</code>
</codeblock>
