Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const JsonString = '{ "name": "Oliver", "age": 12 }';
const user = JSON.parse(JsonString);

if (user.age > 17) {
  console.log("You are eligible");
} else {
  console.log("You are not eligible");
}
</code>
</codeblock>

In the example given above,
we parse a JSON string
and
assign the data to `user`.
If the value of `user.age`
is greater than `17`
we display **"You are eligible"**,
otherwise,
we display **"You are not eligible"**.

What if parsing `JsonString`
did not give a valid value?

<codeblock language="javascript" type="lesson">
<code>
const JsonString = 'null';
const user = JSON.parse(JsonString);

if (user.age > 17) {
  console.log("You are eligible");
} else {
  console.log("You are not eligible");
}
</code>
</codeblock>

In the example above,
we parsed the JSON string `"null"`
and
assigned the value `null` to `user`.
That is why we get an error
at `user.age < 18`.
The value `null` does not have
a property `age`.
So how do we handle this edge case?

<codeblock language="javascript" type="lesson">
<code>
const JsonString = 'null';
const user = JSON.parse(JsonString);

if (user && user.age > 17) {
  console.log("You are eligible");
} else {
  console.log("You are not eligible");
}
</code>
</codeblock>

The example given above
contains one solution to
our edge case.
We can check if `user`
is **truthy** before accessing
any of its properties.

But the cleaner way of doing this
is to use **optional chaining**.
When accessing the property
of an object that we think
might be `null` or `undefined`,
we add a conditional operator as well,
i.e., `?.`.

<codeblock language="javascript" type="lesson">
<code>
const JsonString = 'null';
const user = JSON.parse(JsonString);

if (user?.age > 17) {
  console.log("You are eligible");
} else {
  console.log("You are not eligible");
}
</code>
</codeblock>

We can use optional chaining
for accessing properties of
nested objects as well.

<codeblock language="javascript" type="lesson">
<code>
const candidate1 = {
  name: "Adam Smith",
  education: { gpa: 9 },
}

const candidate2 = {
  name: "Sam Smith"
}

const checkEligibility = candidate => candidate.education?.gpa > 8 ? true : false;

console.log(checkEligibility(candidate1));
console.log(checkEligibility(candidate2));
</code>
</codeblock>

In the example given above,
even though the property `education`
is not defined in `candidate2`,
we do not get an error when accessing
the `gpa` value using optional chaining -
`candidate.education?.gpa`.

In the example given above,
if there is a possibility
that the `candidate` argument
might be `null` or `undefined`,
we can use optional chaining twice:

<codeblock language="javascript" type="lesson">
<code>
const candidate1 = {
  name: "Adam Smith",
  education: { gpa: 9 },
}

const candidate2 = {
  name: "Sam Smith"
}

const candidate3 = null;

const checkEligibility = candidate => candidate?.education?.gpa > 8 ? true : false;

console.log(checkEligibility(candidate1));
console.log(checkEligibility(candidate2));
console.log(checkEligibility(candidate3));
</code>
</codeblock>

In the example given above,
even though the object `candidate3`
had the value `null`,
we do not get an error when accessing
the `education` or `gpa` properties
using optional chaining -
`candidate?.education?.gpa`.
