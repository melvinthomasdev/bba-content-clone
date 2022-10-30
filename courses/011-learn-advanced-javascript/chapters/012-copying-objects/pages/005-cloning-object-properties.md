We can create a clone of an object
by iterating over all the
properties of the object.

In the example given below,
we are iterating over the properties of
the **user** object using a `for...in` loop.

Then, we are copying the properties of **user**
into the **userClone** object.

<Editor lang="javascript">
<code>
let user = {
  name: "Sam",
  age: 32,
  isAdmin: true
};

let userClone = {};

for(let i in user) {
  userClone[i] = user[i];
}

userClone.name = "Oliver";
console.log(user.name);
console.log(userClone.name);
</code>
</Editor>

Here, changing the
**name** property using the **userClone** object
has no effect over the **name**
property of the **user** object.