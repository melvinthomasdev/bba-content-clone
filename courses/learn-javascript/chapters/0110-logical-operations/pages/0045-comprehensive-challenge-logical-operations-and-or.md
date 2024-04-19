Create a function that takes three
parameters :- a number, a string,
and a boolean.

The function should return true if
the number is less than or equal to 10
and the string has a length greater than
or equal to 5, or if the boolean is true.

For example:

```js
Input:
number = 5
string = "hello"
boolean = false

Output:
true
```

Use the following to test the code:

```js
number = 10;
string = "hi";
boolean = true;
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const logicalOperation = () => {
// Write code here
}
</code>
<solution>
const givenNumber = 10;
const givenString = "hi";
const givenBoolean = true;

const logicalOperation = (inputNumber, inputString, inputBoolean) => {
  if (inputNumber <= 10 && inputString.length >= 5 || inputBoolean) {
    console.log(true);
  } else {
    console.log(false);
  };
};

logicalOperation(givenNumber, givenString, givenBoolean);

</solution>
<testcases>
<caller>
logicalOperation(testNumber, testString, testBoolean)
</caller>
<testcase>
<i>
const testNumber = 15;
const testString = "Good-Day";
const testBoolean = false;
</i>
</testcase>
<testcase>
<i>
const testNumber = 7;
const testString = "Heartbeat";
const testBoolean = true;
</i>
</testcase>
<testcase>
<i>
const testNumber = 3;
const testString = "Friday";
const testBoolean = false;
</i>
</testcase>
<testcase>
<i>
const testNumber = 10;
const testString = "Drakarys";
const testBoolean = true;
</i>
</testcase>
</testcases>
</codeblock>
