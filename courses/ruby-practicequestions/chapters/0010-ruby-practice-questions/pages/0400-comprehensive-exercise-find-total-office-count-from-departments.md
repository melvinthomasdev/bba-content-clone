Finish the method definition below.

`department_count` is an array of hashes where each hash contains "department" and "count" keys, where "count" is the number of people in that particular department.

Given `department_count`, the method should return the total number of people in all the departments.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def office_strength(department_count)
  # write your code here
end
</code>

<solution>
def office_strength(department_count)
  department_count.inject(0) { |total, department| total + department[:count] }
end
</solution>

<testcases>
<caller>
puts office_strength(department_count)
</caller>
<testcase>
<i>
department_count = [
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
]
</i>
</testcase>
<testcase>
<i>
department_count = [
  {
    department: "Development",
    department_id: '007',
    count: 9
  },
  {
    department: "QA",
    department_id: '221',
    count: 2
  },
  {
    department: "Design",
    department_id: '42',
    count: 3
  },
  {
    department: "HR",
    department_id: '1',
    count: 1
  }
]

</i>
</testcase>
</testcases>
</codeblock>
