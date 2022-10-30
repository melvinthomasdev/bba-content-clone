Use `JSON.parse()` to convert
the JSON string `adminDetailsJSON`
into an object.

<Editor type="exercise" lang="javascript">
<code>
let adminDetailsJSON = '{"name":"Adam","age":32,"isAdmin":true}';

let adminDetails = ;
console.log(adminDetails);
</code>

<solution>
let adminDetailsJSON = '{"name":"Adam","age":32,"isAdmin":true}';

let adminDetails = JSON.parse(adminDetailsJSON);
console.log(adminDetails);
</solution>
</Editor>