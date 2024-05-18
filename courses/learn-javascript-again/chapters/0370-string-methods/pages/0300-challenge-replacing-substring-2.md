Create a JavaScript function
`updateString` that takes in
three parameters :-
- inputString
- originalSubstring
- additionalSubstring

This function carries out
the following actions:

- Creates a new string by
replacing `originalSubstring`
within `inputString` with a
combination of `originalSubstring`
and `additionalSubstring`
in upperCase.
- Logs the value of the new
string to the console.

For example:
```js
Input:
inputString = "The club can't even handle me right now"
originalSubstring = "club"
additionalSubstring = "house"
Output:
"The clubhouse can't even handle me right now"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const inputString = "Let me sing a teeny story";
const originalSubstring = "teeny";
const additionalSubstring = "tiny";

// Write your code here

updateString(inputString,
  originalSubstring,
  additionalSubstring);
</code>
<solution>
const inputString = "Let me sing a teeny story";
const originalSubstring = "teeny";
const additionalSubstring = "tiny";

const updateString = (
  inputString,
  originalSubstring,
  additionalSubstring
) => {
  const newString = inputString.replace(
    originalSubstring,
    substring => (substring + additionalSubstring).toUpperCase()
  );

  console.log(newString);
};

updateString(inputString,
  originalSubstring,
  additionalSubstring);
</solution>
</codeblock>
