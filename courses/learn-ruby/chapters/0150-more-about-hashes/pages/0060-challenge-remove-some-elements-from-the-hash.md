Here we have a hash of
students with their grades:

|Name   | Grade |
|--|--|
|John   | C   |
|Sally  | B   |
|Adam   | A   |
| Nancy | C   |
| Kelly | A   |

Find all students who got
either the **A** grade or
the **B** grade.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
students = {  John: "C",
              Sally: "B",
              Adam: "A",
              Nancy: "C",
              Kelly: "A" }

# Write your code here
</code>

<solution>
students = {  John: "C",
              Sally: "B",
              Adam: "A",
              Nancy: "C",
              Kelly: "A" }

ab_students = students.reject do |key, value|
  value == "C"
end

puts ab_students
</solution>
</codeblock>
