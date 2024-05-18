Given an array of countries, sorted according to their land area. Complete the definition of `getCountries` function to return the original array of countries intact and an array that contains `ith` largest to `jth` largest countries.

| Rank (Land Area) | Index | Country       |
|------------------|-------|---------------|
| 1st              | 0     | Russia        |
| 2nd              | 1     | Canada        |
| 3rd              | 2     | China         |
| 4th              | 3     | United States |
| 5th              | 4     | Brazil        |
| 6th              | 5     | Australia     |
| 7th              | 6     | India         |
| 8th              | 7     | Argentina     |
| 9th              | 8     | Kazakhstan    |
| 10th             | 9     | Algeria       |

1. The strings `i` & `j` will be of the format (1st, 2nd, 3rd etc)
2. The countries' array will be constant for all test cases.

For example:
```js
Input:
const countries = ['Russia', 'Canada', 'China', 'United States', 'Brazil', 'Australia', 'India', 'Argentina', 'Kazakhstan', 'Algeria'];
const i = '2nd';
const j = '9th';

Output:
{
  "newList": ["Canada", "China", "United States", "Brazil", "Australia", "India", "Argentina", "Kazakhstan"],
  "countries": ["Russia", "Canada", "China", "United States", "Brazil", "Australia", "India", "Argentina", "Kazakhstan", "Algeria"]
}
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getCountries = ({ countries, i, j }) => {
  // write your code here
}
</code>

<solution>
const getCountries = ({ countries, i, j }) =>
  ({
    newList: countries.slice(parseInt(i) - 1, parseInt(j)),
    countries,
  });
</solution>

<testcases>
<caller>
const countries = ['Russia', 'Canada', 'China', 'United States', 'Brazil', 'Australia', 'India', 'Argentina', 'Kazakhstan', 'Algeria'];
    console.log(getCountries({ countries, i, j }));
</caller>
<testcase>
<i>
const i = '1st';
const j = '2nd';
</i>
</testcase>
<testcase>
<i>
const i = '9rd';
const j = '10th';
</i>
</testcase>
<testcase>
<i>
const i = '2nd';
const j = '9th';
</i>
</testcase>
<testcase>
<i>
const i = '3rd';
const j = '5th';
</i>
</testcase>
</testcases>
</codeblock>
