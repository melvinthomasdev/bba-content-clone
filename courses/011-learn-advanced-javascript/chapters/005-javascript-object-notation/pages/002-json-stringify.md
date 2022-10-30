For converting our
object data into JSON,
we need the `JSON.stringify()` method.
It can accept three arguments -

- The `value` that converts
into a JSON string.

- The optional `replacer` parameter,
to be used as a filter.
It can either be
a function or an array.

- The optional `space` parameter
controls the spacing
in the generated string.

In the example given below,
the `JSON.stringify()` method
accepts only the first argument, `userInfo`.
The variable `userInfoJSON` stores
the stringified version of the object `userInfo`.

<Editor lang="javascript">
<code>
let userInfo = {
  firstName: "Sam",
  lastName: "Smith",
};

console.log("Our data in object form: ");
console.log(userInfo);

let userInfoJSON = JSON.stringify(userInfo);

console.log("Our data in JSON form: ");
console.log(userInfoJSON);
</code>
</Editor>

In the example given below,
the `JSON.stringify()` method
also accepts the second argument
`["firstName", "lastName", "numberOfYears"]`.
This filters the output
to include only the properties
that are mentioned in the array.

<Editor lang="javascript">
<code>
let userInfo = {
  firstName: "Sam",
  lastName: "Smith",
  isAdmin: true,
  numberOfYears: 7
};

let userInfoJSON = JSON.stringify(userInfo, ["firstName", "lastName", "numberOfYears"]);

console.log(userInfoJSON);
</code>
</Editor>

In the example given below,
the `JSON.stringify()` method
accepts the second argument `null`
and
the third argument `5`.
The number `5` specifies
the number of indented spaces
in the final JSON string.
Since we are using `null`
as the second argument,
all properties of `userInfo` are
included in the JSON string.

<Editor lang="javascript">
<code>
let userInfo = {
  name: ["Sam", "Smith"],
  isAdmin: true,
  numberOfYears: 7
};

let userInfoJSON = JSON.stringify(userInfo, null, 5);

console.log(userInfoJSON);
</code>
</Editor>