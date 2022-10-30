We can use the `Object.assign` method
to merge multiple objects into one.

In the example given below,
we are merging the **userIsAdmin**
and
the **userAge** objects into the **user** object.

<Editor lang="javascript">
<code>
let user = { name: "Sam" };
let userIsAdmin = { isAdmin: true };
let userAge = { age: 32 };
Object.assign(user, userIsAdmin, userAge);
console.log(user);
</code>
</Editor>

Here, the first argument passed
to `Object.assign` is the **target object**.
All the other arguments are the **source objects**.
The method copies the properties of
all the source objects into the target object
and
returns the target object.