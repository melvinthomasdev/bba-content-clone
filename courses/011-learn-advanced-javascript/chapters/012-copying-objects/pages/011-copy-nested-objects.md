Sometimes, objects have properties
that refer to other objects.

In such cases, it is not enough
to clone the object by iterating over
all its properties.

The problem will be visible in the
following examples:

<Editor lang="javascript">
<code>
let user = {
  name: {
    firstName: "Sam",
    lastName: "Smith"
  },
  status: {
    isAdmin: true,
    canMakeChanges: true
  },
  age: 32
};

let userClone = {};

for(let i in user) {
  userClone[i] = user[i];
}

userClone.name.firstName = "Oliver";
console.log(user.name);
console.log(userClone.name);
</code>
</Editor>

Here, changing the **firstName** property
using the **userClone** object
also changes it in the **user** object.
This is because, the **name**
property of both **user** and **userClone**
hold the same address. Similarly, the
**status** property for both these
objects will refer to the same object.
Making changes using one of these **status**
properties will change the other **status**
property too.

If we want that these
properties do not refer to the same
object address, we need
to use a different approach for cloning:

<Editor lang="javascript">
<code>
let user = {
  name: {
    firstName: "Sam",
    lastName: "Smith"
  },
  status: {
    isAdmin: true,
    canMakeChanges: true
  },
  age: 32
};

let userClone = JSON.parse(JSON.stringify(user));
userClone.name.firstName = "Oliver";
console.log(user.name);
console.log(userClone.name);
</code>
</Editor>

In the example given above,
the `JSON.stringify` method converts
the **user** object into a JSON string.
Then, the `JSON.parse` method converts
the JSON string back into an object.

Now, when we make changes in the
**firstName** property using `userClone`,
the changes are not visible
in the **user** object.