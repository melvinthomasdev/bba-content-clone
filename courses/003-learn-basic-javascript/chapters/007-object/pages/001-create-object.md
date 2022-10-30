For simpler values like text and number,
we can use `String` and `Number`.
For true and false,
we can use `Boolean`.
But what if we need to store complex values
like all the details about a particular car?
It will be much simpler to store
all these values together.
In JavaScript,
we can use an `Object` to store such values.

In the example given below,
we are storing the **fuelType** of a `car` object.

<Editor lang="javascript">
<code>
let car = {
  fuelType: "diesel"
};

console.log(car);
</code>
</Editor>