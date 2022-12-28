Follow the steps given below
to write a program:

1. Create an object `question`
   with the following properties:

   | Key      | Value                       |
   | -------- | --------------------------- |
   | content  | "Is an empty string falsy?" |
   | required | true                        |

2. Create a variable `userAnswer`
   and
   store an empty string `""`
   in it.

3. Using `if`, `else if` and `else`,
   for the condition given
   in the column on the left,
   display the message given
   in the column on the right.

   | Condition                                                         | Message                |
   | ----------------------------------------------------------------- | ---------------------- |
   | `question.required` is `true` and `userAnswer` has the value `""` | "Question is required" |
   | Else if the `userAnswer` is `Yes`                                 | "Correct"              |
   | Else                                                              | "Incorrect"            |

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const question = {
  content: "Is an empty string falsy?",
  required: true,
}

const userAnswer = "";

if (question.required && !userAnswer) {
  console.log("Question is required");
} else if (userAnswer === "Yes") {
  console.log("Correct");
} else {
  console.log("Incorrect");
}
</solution>
</codeblock>