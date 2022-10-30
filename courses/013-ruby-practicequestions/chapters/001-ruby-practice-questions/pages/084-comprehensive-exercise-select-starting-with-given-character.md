Finish the method definition given below.

`students` is an array of hashes. Each hash has the keys `:name` and `:marks`. Given `students` and a character `character`, the method should return filtered array of hashes containing only those students whose name starts with the given character. The name match should be ignore the case.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def matching_name(students, character)
  # Write your code here
end
</code>

<solution>
def matching_name(students, character)
  students.select{ |student| student[:name].chars[0].downcase == character.downcase }
end
</solution>

<testcases>
<caller>
puts matching_name(students, character)
</caller>
<testcase>
<i>
students = [
  { name: 'Phoebe', marks: 44 },
  { name: 'Ross', marks: 78 },
  { name: 'Monica', marks: 89 },
]
character = 'm'
</i>
</testcase>
<testcase>
<i>
students= [
  { name: 'Bruce', marks: 32 },
  { name: 'Tony', marks: 42 },
  { name: 'Natasha', marks: 52 },
  { name: 'Steve', marks: 62 },
  { name: 'Thor', marks: 72 },
  { name: 'Clint', marks: 82 },
]
character = 't'
</i>
</testcase>
<testcase>
<i>
students = [
  { name: 'Frodo', marks: 31 },
  { name: 'Sam', marks: 51 },
  { name: 'Oliver', marks: 71 },
  { name: 'Pippin', marks: 91 },
  { name: 'Shane', marks: 13}
]
character = 's'
</i>
</testcase>
</testcases>
</Editor>