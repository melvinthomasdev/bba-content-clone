The name of a function
should give a clear description of
what the function does.

For example,
a function that combines
the first and last names of a user
and
returns the full name
should not be given names such as
`name`, `combineNames`, or any other name
that does not properly describe
what the function does.

Prefixing a function name with a verb
is a good practice
since it gives the idea that
the name represents a function,
as well as,
gives a description of
what the function does.

Names such as `getFullName` should be used
since it gives a clear idea
of what the function does.
Note that, the name starts with the verb `get`,
which indicates that `getFullName` is a function
and
that it returns a string that contains
both the first and last names.

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  firstName: "Sam",
  lastName: "Smith",
};

const user2 = {
  firstName: "Oliver",
  lastName: "Smith",
};

// This is a bad name
const name = user => `${user.firstName} ${user.lastName}`;
console.log(name(user1));

// This is a good name
const getFullName = user => `${user.firstName} ${user.lastName}`;
console.log(getFullName(user2));
</code>
</codeblock>