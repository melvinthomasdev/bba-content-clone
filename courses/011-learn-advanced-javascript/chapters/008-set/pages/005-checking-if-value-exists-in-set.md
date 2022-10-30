The `has()` method
returns `true` or `false`
depending on the presence
of the value in the `Set`.

<Editor lang="javascript">
<code>
let friends = new Set(["Sam", "Oliver", "Adam"]);

let friendsIncludesSam = friends.has("Sam");
let friendsIncludesEve = friends.has("Eve");

console.log(friendsIncludesSam);
console.log(friendsIncludesEve);
</code>
</Editor>