Use `JSON.stringify()`
to convert the object `adminDetails`
into a JSON string.

<Editor type="exercise" lang="javascript">
<code>
let adminDetails = {
  name: "Adam",
  age: 32,
  isAdmin: true,
};

let adminDetailsJSON = ;

console.log(adminDetailsJSON);
</code>

<solution>
let adminDetails = {
  name: "Adam",
  age: 32,
  isAdmin: true,
};

let adminDetailsJSON = JSON.stringify(adminDetails);

console.log(adminDetailsJSON);
</solution>
</Editor>