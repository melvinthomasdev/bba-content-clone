Complete the function definition below.

Given an array of objects with all the departments & their specific count in an office, the function should return the total count of the office.

1. `count` property of `departmentCount` object will always be of the type `integer`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getOfficeStrength = departmentCount => {
  // write your code here
}
</code>

<solution>
const getOfficeStrength = departmentCount =>
  departmentCount.reduce((total, department) => total + department.count, 0);
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
<testcase>
<i>
const departmentCount = [
  {
    department: "Development",
    count: 12
  },
  {
    department: "QA",
    count: 5
  },
  {
    department: "Sales",
    count: 2
  },
  {
    department: "Design",
    count: 1
  },
  {
    department: "HR",
    count: 1
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
    count: 19
  },
  {
    department: "QA",
    departmentId: '221',
    count: 22
  },
  {
    department: "Design",
    departmentId: '42',
    count: 13
  },
  {
    department: "HR",
    departmentId: '1',
    count: 3
  }
];
</i>
</testcase>
</testcases>
</codeblock>