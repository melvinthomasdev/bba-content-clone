Here we have a hash of
students with their grades:

|Name   | Grade |
|--|--|
|John   | C   |
|Sally  | B   |
|Adam   | A   |
| Nancy | C   |
| Kelly | A   |

Write a program to find all students
who got either the **A** grade or the
**B** grade.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
students = {  John: "C",
              Sally: "B",
              Adam: "A",
              Nancy: "C",
              Kelly: "A" }
</code>

<solution>
students = {  John: "C",
              Sally: "B",
              Adam: "A",
              Nancy: "C",
              Kelly: "A" }

ab_students = students.select do |key, value|
  value == "A" or value == "B"
end

puts ab_students
</solution>
</codeblock>
