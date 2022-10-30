`JSON.parse()` converts a
JSON string back into an object.

<Editor lang="javascript">
<code>
let userInfoJSON = '{"firstName":"Sam","lastName":"Smith"}';

let userInfo = JSON.parse(userInfoJSON);
console.log(userInfo);
</code>
</Editor>