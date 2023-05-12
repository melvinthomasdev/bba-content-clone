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
inputString = "The club can't even handle me right now"
originalSubstring = "club"
additionalSubstring = "house"
// Output should be:
"The clubhouse can't even handle me right now"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here
</code>
<solution>
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
</solution>
<testcases>
<caller>
updateString(
  testString,
  testSubstringOne,
  testSubstringTwo);
</caller>
<testcase>
<i>
const testString = "I'm blue da ba de ba"
const testSubstringOne = "blue"
const testSubstringTwo = "red"
</i>
</testcase>
<testcase>
<i>
const testString = "I'm happy and I know it"
const testSubstringOne = "happy"
const testSubstringTwo = "amazing"
</i>
</testcase>
<testcase>
<i>
const testString = "Party rock is in the house tonight!"
const testSubstringOne = "house"
const testSubstringTwo = "boat"
</i>
</testcase>
<testcase>
<i>
const testString = "Yeah okay alright"
const testSubstringOne = "Yeah"
const testSubstringTwo = "Nope"
</i>
</testcase>
</testcases>
</codeblock>
