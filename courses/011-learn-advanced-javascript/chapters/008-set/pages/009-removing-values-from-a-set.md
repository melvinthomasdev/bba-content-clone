The `delete()` method
removes the value from the
Set. If it finds the value
inside the Set and is able to
delete it, it returns **true**.
It returns **false** if it was
unable to find the value and delete
it from the Set.

<Editor lang="javascript">
<code>
let friends = new Set(["Sam", "Oliver", "Adam"]);

let removeAdamFromFriends = friends.delete("Adam");

console.log(removeAdamFromFriends);
console.log("Updated List: ", friends);
</code>
</Editor>