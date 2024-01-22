When a function is nested
inside another function,
**closure** enables the nested function
to access the variables
defined in the outer function.

In the example given below,
the function `displayName` is
nested inside the function `displayUserInfo`.
The nested function `displayName` can access
the properties `firstName` and `lastName`
of the `user` object defined inside
the outer function `displayUserInfo`.

<codeblock language="javascript" type="lesson">
<code>
const displayUserInfo = () => {
  const user = {
    firstName: "Oliver",
    lastName: "Smith",
  }

  const displayName = () => {
    console.log(`${user.firstName} ${user.lastName}`);
  }

  displayName();
}

displayUserInfo();
</code>
</codeblock>