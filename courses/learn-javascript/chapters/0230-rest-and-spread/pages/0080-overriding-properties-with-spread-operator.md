Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const userDetails = {
  name: "Oliver Smith",
  email: "oliver@example.com",
  yearsOfExperience: 4,
};

const updatedUserDetails = {
  ...userDetails,
  yearsOfExperience: 6,
}

console.log(updatedUserDetails);
</code>
</codeblock>

In the above example,
key-value pairs from `userDetails`
and
another key-value pair  `yearsOfExperience: 6`
were inserted in `updatedUserDetails`.
Since, the key `yearsOfExperience` were inserted in the object twice,
the value from the key-value pair added last,
i.e., `yearsOfExperience: 6` will be retained.

Let's see what happens if
the order is changed inside
the definition of `updatedUserDetails`:

<codeblock language="javascript" type="lesson">
<code>
const userDetails = {
  name: "Oliver Smith",
  email: "oliver@example.com",
  yearsOfExperience: 4,
};

const updatedUserDetails = {
  yearsOfExperience: 6,
  ...userDetails,
}

console.log(updatedUserDetails);
</code>
</codeblock>

In the example given above,
two properties with the key `yearsOfExperience`
are inserted into `updatedUserDetails`.
However, since the last of those properties
to be added was `yearsOfExperience: 4`,
the value from that property will be retained.

<codeblock language="javascript" type="lesson">
<code>
const userDetails = {
  name: "Oliver Smith",
  email: "oliver@example.com",
  yearsOfExperience: 4,
};

const updatedDetails = {
  email: "oliver.smith@example.com",
  yearsOfExperience: 6,
}

const updatedUserDetails = {
  ...userDetails,
  ...updatedDetails,
  yearsOfExperience: 7,
}

console.log(updatedUserDetails);
</code>
</codeblock>

In the example given above,
`updatedUserDetails` is created using the following:

- key-value pairs from the `userDetails` object.

- key-value pairs from the `updatedDetails` object.

- the key-value pair - `yearsOfExperience: 7`

Even though three properties with
the key `yearsOfExperience` was
inserted into `updatedUserDetails`,
only the value from the property added last,
i.e., `yearsOfExperience: 7`,
was retained.
