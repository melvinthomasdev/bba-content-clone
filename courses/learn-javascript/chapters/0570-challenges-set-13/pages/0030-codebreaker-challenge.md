Write a function decipherMessage that takes a single string parameter, codedMessage.

1. Find all words in the coded message that start with 'XC' and end with 'QT'.

2. Remove the 'XC' prefix and 'QT' suffix from each matching word.

3. Recreate the original sentence by joining these words with spaces.

4. Display the resulting sentence on the console.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code below this line
</code>
<solution>
// Write code below this line
const decipherMessage = (codedMessage) => {
  const pattern = /XC(\w*)QT/g;

  const originalSentence = codedMessage.replace(pattern, (match, word) => word);

  console.log(originalSentence);
};

</solution>
<testcases>
<caller>
decipherMessage(inputMessage);
</caller>
<testcase>
<i>
const inputMessage = "This is a XCbrownQT XCdogQT XCjumpsQT over the XCquickQT XClazyQT XCfoxQT.";
</i>
</testcase>
<testcase>
<i>
const inputMessage = "XChelloQT world XCbyeQT XCagainQT";
</i>
</testcase>
<testcase>
<i>
const inputMessage = "No words match the pattern here.";
</i>
</testcase>
<testcase>
<i>
const inputMessage = "Testing some XCatQT the beginning XCmiddleQT and end of XCstringsQT";
</i>
</testcase>
<testcase>
<i>
const inputMessage = "XConlyQT XCwordsQT XCmatchesQT intended.";
</i>
</testcase>
</testcases>
</codeblock>
