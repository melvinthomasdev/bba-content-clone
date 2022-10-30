We can use an object to store
data as key, value pairs. But there
are some restrictions on what type
of data can we use as keys. There
is a better way called `Map` to store data
where we can store any type of key or value.

<Editor lang="javascript">
<code>
let myMap = new Map([
  ["name", "Sam Smith"],
  [32, "age"],
  [false, "isAdmin"]
  ]);
console.log(myMap);
</code>
</Editor>