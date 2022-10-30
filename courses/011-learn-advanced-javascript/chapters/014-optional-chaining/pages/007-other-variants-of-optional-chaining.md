Optional chaining `?.` also works with
functions and square brackets.

We can use `?.()` to execute
a function that may not exist.

<Editor lang="javascript">
<code>
let userSam = {
  name: "Sam Smith",
  message() {
    console.log("I Sam Smith");
  }
};

let userOliver = {};

userSam.message?.();
userOliver.message?.();
</code>
</Editor>

In the example given above,
the optional chaining checks whether
the `message` function exists
in the `userSam` object or not. Since, this
is correct, the function gets executed.

On the other hand, the `message`
function does not exist in the
`userOliver` object and hence
there is no attempt at executing it.
JavaScript simply returns **undefined**.

We can use square brackets `?.[]` to
access the properties of an object.
If the property does not exist,
it returns `undefined`.

<Editor lang="javascript">
<code>
let userName = "name";

let userSam = {
  name: "Sam Smith"
}

let userOliver = null;

console.log(userSam?.[userName]);
console.log(userOliver?.[userName]);
</code>
</Editor>

In the example given above,
the **name** property exists
in the **userSam** object
and
it does not exist in the **userOliver** object.
Therefore, the first `console.log` statement
returns **Sam Smith**
and
the second `console.log` statement
returns **undefined**.

We can use optional chaining `?.`
with **delete** to remove
an existing property from an object.

<Editor lang="javascript">
<code>
let userSam = {
  name: "Sam Smith",
  age: 32
}

delete userSam?.age;

console.log(userSam);
</code>
</Editor>

In the example given above,
we are removing the **age** property
from the **userSam** object.