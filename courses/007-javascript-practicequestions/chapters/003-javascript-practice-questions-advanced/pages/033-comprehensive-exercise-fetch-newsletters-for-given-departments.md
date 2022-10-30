The function `getNewsletterList` should return an alphabetically sorted single dimensional array of newsletters for the given departments in `departmentNamesList` list.

```
Programming: ['frontend', 'backend', 'database', 'javascript', 'ruby']
QA: ['unit testing', 'regression testing', 'alpha testing', 'beta testing']
Marketing: ['outbound', 'inbound', 'digital', 'content', 'video']
Sales: ['inside', 'outside', 'client services', 'lead generation']
```

1. The `departmentNewsletterList` may not have all the department names given in departmentNamesList.
2. If none of departments specified in departmentNamesList is present in departmentNewsletterList, then return false.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getNewsletterList(departmentNewsletterList, departmentNamesList){
        // write your code here
    }
</code>

<solution>
function getNewsletterList(departmentNewsletterList, departmentNamesList){
        const newsletterList = [];
        departmentNamesList.forEach(function (department) {
            if (departmentNewsletterList.has(department)) {
                newsletterList.push(...departmentNewsletterList.get(department));
            }
        });
        return newsletterList.length ? newsletterList.sort() : false;
    }
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
    console.log(getNewsletterList(departmentNewsletterList, departmentNamesList));
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
</Editor>