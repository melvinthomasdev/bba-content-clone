Given a coded message and a key, the real message is hidden inside it, and we need to crack the code and return it. Each word in the message will have a number as a prefix. If a word's prefix number is perfectly divisible by the given `key`, then the word following it will be part of the decoded message.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const enigmaFunction = ({ message, key }) => {
  // your code here
}
</code>

<solution>
const enigmaFunction = ({ message, key }) => {
  const arrayOfWords = message.split(" ");
  const decodedMessage = arrayOfWords.reduce(
    (message, currentWord, index) =>
      parseInt(currentWord) % key === 0
        ? `${message} ${removeDigits(arrayOfWords[index])}`
        : message,
    ""
  );
  return String(decodedMessage.trim());
};

const removeDigits = string => string.replace(parseInt(string), "");
</solution>

<testcases>
<caller>
console.log(enigmaFunction({ message, key }));
</caller>
<testcase>
<i>
const key = 13;
const message = `12The 908happy 333party 208troops 468will 124never 42fail 761to 936move 202my 765heart. 412This 297happened 64again 1040in 70the 17Coffee 99Shop 208today 416at 210sunset 99time. 321I 3want 2to 404visit 3all 313of 418the 780seven 23wonders 3123of 21the 09world`;
</i>
</testcase>
<testcase>
<i>
const key = 15;
const message = `15I 390love 108coding 5and 56solving 3problems. 72Programming 10is 48my 20passion 55and 10I 11enjoy 90learning 45new 60technologies.`;
</i>
</testcase>
<testcase>
<i>
const key = 5;
const message = `15Working 150from 75home 125has 40become 85the 30new 110normal 77Remote 66collaboration 11is 17essential 20for 90modern 40workplaces.`;
</i>
</testcase>
<testcase>
<i>
const key = 6;
const message = `12Exploring 180the 90beauty 120of 48nature 70brings 14peace 65to 77my 40soul. 110Hiking 105in 15the 40mountains 36is 18my 30favorite 36weekend 30activity.`;
</i>
</testcase>
</testcases>
</codeblock>