When we compare two similar looking objects
stored in different variables,
we see that they are not equal:

<Editor lang="javascript">
<code>
let user = { name: "Sam" };
let anotherUser = { name: "Sam" };

console.log(user == anotherUser);
</code>
</Editor>

In this example, both **user** and
**anotherUser** store the same
key-value pairs: `{ name: "Sam" }`.
But they are not equal.

Think about it, as soon as we say
that we want to store a value in a variable,
JavaScript will save it in memory somewhere. Now,
we have two different code statements here:
`let user = { name: "Sam" };`
and
`let anotherUser = { name: "Sam" };`
This means that JavaScript will save 2 different
objects.

If this much is clear to you,
know that objects are treated differently than
any other data in JavaScript. Instead of the variable
holding the actual object value, the variable will
hold the address of the object.

Now, we have two different objects, so their
memory addresses will be different too.
So, it doesn't matter whether they hold the
same key-value pairs, their addresses which
are right now stored in **user** and **anotherUser** will
not be equal to each other.

This is why, the result of their comparison
is `false`.

Now, look at this example:

<Editor lang="javascript">
<code>
let user = { name: "Sam" };
let anotherUser = user;

console.log(user == anotherUser);
</code>
</Editor>

In the example given above,
the variables `user` and `anotherUser`
hold the address of the same object.
So, when we compare them, we have
the same address in both of them.
This is why, the result of their
comparison is `true`.