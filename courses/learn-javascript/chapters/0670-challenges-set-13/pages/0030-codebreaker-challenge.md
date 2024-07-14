Create a function`decipherMessage` that takes a single string parameter, **codedMessage**. The function should follow these steps,

  1. Find all words in the coded message that start with *'XC'* and end with *'QT'* and has exactly 3 numbers in it.
  2. Find all words in the codedMessage that:
    - Start with the prefix ‘XC’.
	  - End with the suffix ‘QT’.
	  - Contain exactly 3 digits anywhere in the word.
  4. For each word that matches the criteria:
    - Remove the ‘XC’ prefix.
	  - Remove the ‘QT’ suffix.
	  - Remove all digits.
  3. Join the transformed words together to form a new sentence, with each word separated by a space.
  4. Display the resulting sentence on the console.

For example,
```js
Input:

const codedMessage = "XCL1e23tQT over and XCm1e23QT XCintroduce456QT XQt1o2jkl3TQ XQ1t2oQT XCJava1Scr2ipt3QT XCprogramming345QT";

Output:
"Let me introduce JavaScript programming"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code below this line
</code>
<solution>
// Write code below this line
const decipherMessage = (codedMessage) => {

  const words = codedMessage.split(' ');
  const transformedWords = [];
  words.forEach(word => {
    if (word.startsWith('XC') && word.endsWith('QT')) {
      const middlePart = word.slice(2, -2);
      const digitCount = (middlePart.match(/\d/g) || []).length;
      if (digitCount === 3) {
        const transformedWord = middlePart.replace(/\d/g, '');
        transformedWords.push(transformedWord);
      }
    }
  });
  const resultSentence = transformedWords.join(' ');
  console.log(resultSentence);
}

</solution>
<testcases>
<caller>
decipherMessage(codedMessage);
</caller>
<testcase>
<i>
const codedMessage = "XCM1e2e3tQT world XCm456eQT XCa1t24QT message XCce12n2terQT XCs3q1ua3reQT";
</i>
</testcase>
<testcase>
<i>
const codedMessage = "XCplease123QT XCm1e3QT XCtake456QT XDce12n2terCQT XCme789QT XC1to12QT XCyour456QT XCb3a4s5eQT";
</i>
</testcase>
<testcase>
<i>
const codedMessage = "No words match the pattern here.";
</i>
</testcase>
<testcase>
<i>
const codedMessage = "XCCom2ple3ted4QT XQandQT XQALLQT XC1and3QL XC1suc1cess2fullyQT";

</i>
</testcase>
</testcases>
</codeblock>
