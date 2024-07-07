Find the index of the element in the given array. Return the index if the element is present. Otherwise, return `Not found`.

For example:
```js
Input:
list = ["Soyuz", "SpaceShuttle", "Vostok", "Gemini", "Apollo"];
value = "Voskhod";

Output:
Not found
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getIndex = ({ list, value }) => // write your code here
</code>

<solution>
const getIndex = ({ list, value }) => {
  const index = list.indexOf(value);
  return index !== -1 ? index : "Not found";
}
</solution>

<testcases>
<caller>
console.log(getIndex({ list, value }));
</caller>
<testcase>
<i>
const list = ["MacBook", "Asus Zenbook 14", "MacBook Pro 13", "iMac", "MacBook Pro"];
const value = "iMac";
</i>
</testcase>
<testcase>
<i>
const list = ["Star", "Blackhole", "Planet", "Asteroid", "Constellation"];
const value = "Wormhole";
</i>
</testcase>
<testcase>
<i>
const list = ["ISRO", "NASA", "JAXA", "Roscosmos", "ESA"];
const value = "ISRO";
</i>
</testcase>
<testcase>
<i>
const list = ["Soyuz", "SpaceShuttle", "Vostok", "Gemini", "Apollo"];
const value = "Voskhod";
</i>
</testcase>
</testcases>
</codeblock>
