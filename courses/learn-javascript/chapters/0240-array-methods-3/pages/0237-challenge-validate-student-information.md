You're developing a function for
a school system that validates
a list of student objects based
on multiple criteria.

Your task is to create a function named `validateStudents` that checks if
all students in an array meet
the following criteria:

- Name Validity: Every student must have a name property that is a non-empty string.
- Age Validity: Every student must have an age property that is an integer between 5 and 18 (inclusive).
- Grades Validity: Every student must have a grades property that is an array of numbers between 0 and 100 (inclusive), and this array must contain at least one grade (it can't be empty).

The `validateStudents` function should return
`true` if all students in the array meet
these criteria and false otherwise.

For example:
```js
Input:
studentsArray =[
  { name: "Alice", age: 15, grades: [90, 80, 85] },
  { name: "", age: 19, grades: [90, 80, 85] },
  { name: "Bob", age: 17, grades: [75, 85, 92] }
]

Output: false
```
Log the output to the console.
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const studentsArray =[
  { name: "Alice", age: 15, grades: [90, 80, 85] },
  { name: "", age: 19, grades: [90, 80, 85] },
  { name: "Bob", age: 17, grades: [75, 85, 92] },
  { name: "Dan", age: 14, grades: [] },
  { name: "Charlie", age: 16, grades: [100, 90] }
];

// Write code below

</code>
<solution>
const studentsArray =[
  { name: "Alice", age: 15, grades: [90, 80, 85] },
  { name: "", age: 19, grades: [90, 80, 85] },
  { name: "Bob", age: 17, grades: [75, 85, 92] },
  { name: "Dan", age: 14, grades: [] },
  { name: "Charlie", age: 16, grades: [100, 90] }
];

// Write code below
const validateStudents = (students) => {
  return students.every(student =>
    typeof student.name === 'string' && student.name.trim() !== '' &&
    Number.isInteger(student.age) && student.age >= 5 && student.age <= 18 &&
    Array.isArray(student.grades) && student.grades.length > 0 &&
    student.grades.every(grade => typeof grade === 'number' && grade >= 0 && grade <= 100)
  );
};

console.log(validateStudents(studentsArray));
</solution>
</codeblock>
