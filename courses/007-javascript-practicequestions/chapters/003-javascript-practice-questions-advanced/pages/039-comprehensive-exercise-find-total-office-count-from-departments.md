Complete the function definition below.

Given an array of object with all the departments & their specific count in an office, the function should return the total count of the office.

1. count property of departmentCount object will always be of the type integer.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getOfficeStrength(departmentCount){
        // write your code here
  }
</code>

<solution>
function getOfficeStrength(departmentCount){
        return departmentCount.reduce(
            (total, department) => total + department.count, 0);
    }
</solution>

<testcases>
<caller>
console.log(getOfficeStrength(departmentCount));
</caller>
<testcase>
<i>
const departmentCount = [
  {
    department: "Development",
    count: 31
  },
  {
    department: "QA",
    count: 29
  },
  {
    department: "Sales",
    count: 10
  },
  {
    department: "Design",
    count: 4
  },
  {
    department: "HR",
    count: 3
  }
];
</i>
</testcase>
<testcase>
<i>
const departmentCount = [
  {
    department: "Development",
    departmentId: '007',
    count: 09
  },
  {
    department: "QA",
    departmentId: '221',
    count: 2
  },
  {
    department: "Design",
    departmentId: '42',
    count: 3
  },
  {
    department: "HR",
    departmentId: '1',
    count: 1
  }
];
</i>
</testcase>
</testcases>
</Editor>