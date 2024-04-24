The function `getNewsletterList` should return an alphabetically sorted single-dimensional array of newsletters for the given departments in `departmentNamesList` list. The newsletters for some departments are defined in the map named as `departmentNewsletterList` like this:

```js
const departmentNewsletterObject = {
  Programming: ['frontend', 'backend', 'database', 'javascript', 'ruby'],
  QA: ['unit testing', 'regression testing', 'alpha testing', 'beta testing'],
  Marketing: ['outbound', 'inbound', 'digital', 'content', 'video'],
  Sales: ['inside', 'outside', 'client services', 'lead generation']
};
```

1. The `departmentNewsletterList` may not have all the department names given in `departmentNamesList`.
2. If none of the departments specified in departmentNamesList is present in departmentNewsletterList, then return false.

For example:
```js
Input:
const departmentNewsletterObject = {
  Programming: ['frontend', 'backend', 'database', 'javascript', 'ruby'],
  QA: ['unit testing', 'regression testing', 'alpha testing', 'beta testing'],
  Marketing: ['outbound', 'inbound', 'digital', 'content', 'video'],
  Sales: ['inside', 'outside', 'client services', 'lead generation']
};
const departmentNewsletterList = new Map(Object.entries(departmentNewsletterObject));
const departmentNamesList = ['Programming', 'QA'];

Output:
['alpha testing', 'backend', 'beta testing', 'database', 'frontend', 'javascript', 'regression testing', 'ruby', 'unit testing']
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getNewsletterList = ({ departmentNewsletterList, departmentNamesList }) => {
  // write your code here
}
</code>

<solution>
const getNewsletterList = ({ departmentNewsletterList, departmentNamesList }) => {
  sortedNewsletters = departmentNamesList
    .reduce(
      (newsletters, department) =>
        departmentNewsletterList.has(department)
          ? [...newsletters, ...departmentNewsletterList.get(department)]
          : newsletters,
      []
    )
    .sort();
  return sortedNewsletters.length > 0 ? sortedNewsletters : false;
};
</solution>

<testcases>
<caller>
const departmentNewsletterObject = {
      Programming: ['frontend', 'backend', 'database', 'javascript', 'ruby'],
      QA: ['unit testing', 'regression testing', 'alpha testing', 'beta testing'],
      Marketing: ['outbound', 'inbound', 'digital', 'content', 'video'],
      Sales: ['inside', 'outside', 'client services', 'lead generation']
    };
    const departmentNewsletterList = new Map(Object.entries(departmentNewsletterObject));
    console.log(getNewsletterList({ departmentNewsletterList, departmentNamesList }));
</caller>
<testcase>
<i>
const departmentNamesList = ['Programming', 'QA'];
</i>
</testcase>
<testcase>
<i>
const departmentNamesList = ['Sales', 'Marketing'];
</i>
</testcase>
<testcase>
<i>
const departmentNamesList = ['Design', 'Programming'];
</i>
</testcase>
<testcase>
<i>
const departmentNamesList = ['HR', 'Product Management'];
</i>
</testcase>
</testcases>
</codeblock>
