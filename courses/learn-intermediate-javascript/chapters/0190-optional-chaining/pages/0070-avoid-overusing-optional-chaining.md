Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const candidate1 = {
  name: "Oliver Smith",
  location: "India",
  education: {
    college: {
      name: "ABC Institute",
      course: "B.Tech",
      score: "95",
    },
  },
};

const candidate2 = {
  name: "Adam Smith",
  location: "India",
};

console.log(candidate1.education?.college.name);
console.log(candidate1.education?.college.name);
</code>
</codeblock>

In the above example,
we have two objects
`candidate1` and `candidate2`.
We use optional chaining while
accessing the `education` property
in both the objects,
because there is a chance that the property
might be undefined.

However, if it is known that,
if the `education` property has a value,
it will also have `education.college`
and
`education.college.name`,
we do not need to use optional chaining
for the `college` or `name` properties.
In other words avoid
unnecessary optional chaining
like `candidate1?.education?.college?.name`.
