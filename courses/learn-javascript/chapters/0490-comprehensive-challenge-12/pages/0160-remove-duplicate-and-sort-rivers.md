The function `removeDuplicateAndSort` should remove duplicate river names and sort them alphabetically.

1. In case of an empty array return `false`

For example:
```js
Input:
rivers = ['Ghaghara', 'Ganga', 'Yamuna', 'Jhelum', 'Ghaghara', 'Ganga', 'Jhelum'];

Output:
[
  'Ganga',
  'Ghaghara',
  'Jhelum',
  'Yamuna'
]
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const removeDuplicateAndSort = rivers =>
  // your code here
}
</code>

<solution>
const removeDuplicateAndSort = rivers => {
  if (rivers.length === 0)
    return false;

  const filteredList = [...new Set(rivers)];
  return filteredList.sort();
}
</solution>

<testcases>
<caller>
console.log(removeDuplicateAndSort(rivers));
</caller>
<testcase>
<i>
const rivers = ['Periyar', 'Kaveri', 'Tungabhadra', 'Pampa', 'Periyar', 'Tungabhadra', 'Pampa'];
</i>
</testcase>
<testcase>
<i>
const rivers = ['Barak', 'Danba Qu', 'Barak', 'Gomati', 'Teesta', 'Danba Qu', 'Barak', 'Gomati'];
</i>
</testcase>
<testcase>
<i>
const rivers = ['Ghaghara', 'Ganga', 'Yamuna', 'Jhelum', 'Ghaghara', 'Ganga', 'Jhelum'];
</i>
</testcase>
<testcase>
<i>
const rivers = ['Mississippi', 'Amazon', 'Nile', 'Danube', 'Mississippi', 'Amazon', 'Volga'];
</i>
</testcase>
</testcases>
</codeblock>
