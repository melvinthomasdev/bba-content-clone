Given a coded message and a key, the real message is hidden inside it, and we need to crack the code and return only it. Each word in the message will have a number as prefix, and any word that has a prefix numbers, that is perfectly divisble by the key, then the word following this, will be part of the message.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const enigmaFunction = (message, key) => {
  // your code here
}
</code>

<solution>
const enigmaFunction = (message, key) => {
  const arrayOfWords = message.split(" ");
  const decodedMessage = arrayOfWords.reduce(
    (accumulator, currentValue, index) => {
      return parseInt(currentValue) % key === 0
        ? `${accumulator} ${arrayOfWords[index + 1].replace(
            parseInt(arrayOfWords[index + 1]),
            ""
          )}`
        : accumulator;
    },
    ""
  );
  return String(decodedMessage.trim());
};
</solution>

<testcases>
<caller>
console.log(enigmaFunction(message, key));
</caller>
<testcase>
<i>
const key = 13;
const message = '12The 908happy 468party 208troops 333will 124never 42fail 936to 761move 202my 765heart. 412This 297happened 1040again 64in 70the 17Coffee 780Shop 208today 55at 210sunset 99time. 321I 3want 2to 404visit 3all 313of 416the 99seven 23wonders 3123of 21the 09world';
</i>
</testcase>
</testcases>
</Editor>