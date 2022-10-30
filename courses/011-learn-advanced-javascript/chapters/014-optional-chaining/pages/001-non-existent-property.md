Sometimes while writing the code,
we do not know whether the object
that we are going to access
contains all the necessary properties.

<Editor lang="javascript">
<code>
let user = {
  name: "Sam Smith"
}

console.log(user.details);
console.log(user.details.address);
</code>
</Editor>

In the example given above,
accessing the `details` property of
the `user` returns `undefined`.
This is because the `user` object
does not contain the `details` property.
But when we try to access the `address` property,
assuming that it is nested inside the `details` property,
it results in an error.

In many practical cases,
getting `undefined` is convenient.

One way to achieve this is shown
in the example given below:

<Editor lang="javascript">
<code>
let user = {
  name: "Sam Smith"
}

console.log(user.details ? user.details.address : undefined);
</code>
</Editor>

There is no error in the example given above.
But we have to use `user.details` repeatedly.
This becomes a matter of concern
for deeply nested properties.
Multiple use of the conditional operator will also
make the code difficult to understand.

This is one way to work when we do
not know whether the property exists or
not. Since, this isn't ideal, we have to look
at a better solution.