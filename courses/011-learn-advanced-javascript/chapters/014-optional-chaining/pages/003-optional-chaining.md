We can use optional chaining `?.` when
we are not certain if the object contains
the property that we are accessing.
The execution stops
and
returns **undefined**
if the value before `?.` does not exist.

Let's look at an example:

<Editor lang="javascript">
<code>
let user = {
  name: "Sam Smith"
}

console.log(user.details?.address);
</code>
</Editor>

In the example given above,
we are accessing the **address** property
with the assumption that it is nested inside
the **details** property of the **user** object.
It returns **undefined** because
the property does not exist.

<Editor lang="javascript">
<code>
let user = {
  name: "Sam Smith"
}

console.log(user?.details?.address);
console.log(user?.details.address);
</code>
</Editor>

In the example given above,
the first `console.log` statement
returns **undefined**.
The second `console.log` statement
results in an error because
we are using the `.` operator.