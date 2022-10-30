Follow the steps given below
to write a program:

1. Create an object `student` that
stores the properties given in the
table below:

    | Key         | Value    |
    | ----------- | -------- |
    | name | Renu Sen |
    | age         | 21       |
    | rollNumber  | 34       |

2. Use the **dot notation**
to read all the values
stored in the object.

3. Show the values
one after the other
using `console.log()`.

4. Add the value `1234` to
the `id` key.

5. Finally show the `student` object
on the console.


<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let student = {
  name: "Renu Sen",
  age: 21,
  rollNumber: 34
};

console.log(student.name);
console.log(student.age);
console.log(student.rollNumber);

student.id = 1234;

console.log(student);
</solution>
</Editor>