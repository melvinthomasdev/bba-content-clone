Given two sentences, return a list with all the unique words.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const uniqueWords = ({ s1,s2 }) => {
  // your code here
}
</code>

<solution>
const uniqueWords = ({ s1, s2 }) => {
  const result = [...new Set([...s1.split(" "),...s2.split(" ")])];
  return result;
};
</solution>

<testcases>
<caller>
console.log(uniqueWords({ s1,s2 }));
</caller>
<testcase>
<i>
const s1 = "John likes Icecream";
const s2 = "Everyone likes Icecream";
</i>
</testcase>
<testcase>
<i>
const s1 = "BigBinary says Hello"
const s2 = "Hello BigBinary";
</i>
</testcase>
<testcase>
<i>
const s1 = "Sunrises are Awesome"
const s2 = "Sunsets are Awesome";
</i>
</testcase>
<testcase>
<i>
const s1 = "With great power"
const s2 = "Comes great responsibility";
</i>
</testcase>
</testcases>
</codeblock>