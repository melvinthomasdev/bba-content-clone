When you have a number of conditions to evaluate for a given expression, using an `if else` might not be the best method.

Let us look at an example where, based on the value of  the variable `languageCode`, we print the name of the language.

<codeblock language="javascript" type="lesson">
<code>
let languageCode = 'en';

// Using if else

if (languageCode === 'hi') {
    console.log("Hindi");
} else if (languageCode === 'de') {
    console.log("German (Standard)");
} else if (languageCode === 'en') {
    console.log("English");
} else if (languageCode === 'fr') {
    console.log("French (Standard)");
} else if (languageCode === 'es') {
    console.log("Spanish (Spain)");
} else {
    console.log("Sorry, we do not support the given language as of now");
}

languageCode = 'hi';

// Using switch case

switch(languageCode) {
  case "hi":
    console.log("Hindi");
    break;
  case "de":
    console.log("German (Standard)")
    break;
  case "en":
    console.log("English");
    break;
  case "fr":
    console.log("French (Standard)");
    break;
  case "es":
    console.log("Spanish (Spain)");
    break;
  default:
    console.log("Sorry, we do not support the given language as of now");
    break;
}

</code>
</codeblock>

As you can see, the switch case method seems more readable when there are a lot of conditions being evaluated for a given expression, in this case the value of the variable `languageCode`.


**Let us break down the switch case code:**

- We pass an expression
  to the `switch` statement,
  that is, within the parentheses
  of `switch()`. We can call this
  the **switch expression**. 

- It is followed by a number of
  **cases**. Each **case** contains
  a **value** and a **code block**.

- All `switch` statements
  must also contain a
  **default** block.

- The value of the **switch expression**
  is then compared with the value
  of each **case**,
  to see if they are equal.

- The **code block** of the first
  **case** whose value is equal
  to the value of the **switch expression**
  is executed.

- If the value of the **switch expression**
  does not match with any of the **cases**,
  then the **default** code block is executed.

In another example given below, we get the role of a person in a company, based on their name. When the value of `name` matches with a case, the code block of that case is executed.

<codeblock language="javascript" type="lesson">
<code>
const name = "Anna";

switch(name) {
  case "Oliver":
    console.log("This is the owner.");
    break;
  case "Anna":
    console.log("This is the admin.");
    break;
  case "Mike":
    console.log("This is the manager.");
    break;
  default:
    console.log("This person does not have a role.");
    break;
}
</code>
</codeblock>

The above code displays **This is the admin.** because the value of the `name` variable is equal to the value of the case **Anna** and the code block for that case contains `console.log("This is the admin.")` followed by a `break` statement.

**break Statement**

- The `break` statement is used to exit the execution of a `switch` statement. 
- If the `break` statement is not present at the end of a code block the `switch` statement continues its execution to the next case block.
- As you can see in the below example, this happens irrespective of whether the condition, here the value of `name` is matched with that case or not.

<codeblock language="javascript" type="lesson">
<code>
const name = "Anna";

switch(name) {
  case "Oliver":
    console.log("This is the owner.");
    break;
  case "Anna":
    console.log("This is the admin."); // This will be executed
  case "Mike":
    console.log("This is the manager."); // This will also be executed
    break;
  default:
    console.log("This person does not have a role.");
    break;
}
</code>
</codeblock>

If the given expression does not match with any case value, then the code block of the **default** case gets executed. The encouraged practice is to always write the  `default` block after all the **cases**. 
