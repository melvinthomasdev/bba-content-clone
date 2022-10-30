The `add()` method adds
values to a `Set`.

Since, a Set only holds unique
values, calling the `add()`
method with the same value more than
once does not add the
value multiple times to the `Set`.

<Editor lang="javascript">
<code>
let friends = new Set();

let firstFriend = "Sam";
let secondFriend = "Oliver";
let thirdFriend = "Adam";

friends.add(firstFriend);
friends.add(secondFriend);
friends.add(thirdFriend);
friends.add(firstFriend);
friends.add(secondFriend);

console.log(friends);
</code>
</Editor>

You can see in this example,
even though we added the **firstFriend**
and **secondFriend** values twice,
the **friends** set still only stored
them a single time.