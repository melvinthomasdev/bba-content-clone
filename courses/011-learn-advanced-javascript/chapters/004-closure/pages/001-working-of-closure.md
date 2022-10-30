Closure enables the inner function
to access the variables
defined in the outer function.
It helps us create
private variables and functions.

In the example given below,
the function `printName` is
nested inside the function `userInfo`.
The nested function can access
the variables `firstName` and `lastName`.

<Editor lang="javascript">
<code>
function userInfo(firstName, lastName) {

  function printName() {
    console.log(firstName + " " + lastName);
  }

  printName();
}

userInfo("Sam", "Smith");
</code>
</Editor>