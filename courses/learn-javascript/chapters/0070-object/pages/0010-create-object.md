For simpler values like text and number,
we can use the `String` and `Number` types.
For `true` and `false`,
we can use the `Boolean` type.
But what if we need to store compound values
like all the details about a particular car?
It will be much simpler to store
all these values together.

In JavaScript, we can use
the `Object` type to store such values
that are are related.

Take a look at the below image to see
what an **object** looks like.

![javaScript object](https://ucarecdn.com/1b37cf46-3a65-4c02-b89b-f389135ba74a/jsbestpractices.png)

In the example given below,
we are storing the **fuelType** of a car
in an object named `car`.

<codeblock language="javascript" type="lesson">
<code>
const car = {
  fuelType: "diesel"
};

console.log(car);
</code>
</codeblock>