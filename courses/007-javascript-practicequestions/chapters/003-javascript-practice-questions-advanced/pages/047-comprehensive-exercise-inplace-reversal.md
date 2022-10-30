Given an input sentence, perform an in-place reversal of all words from the string.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const inPlaceReversal = (str) => {
  // your code here
};
</code>

<solution>
const inPlaceReversal = (str) => {
  return str.split("").reverse().join("").split(" ").reverse().join(" ");
};
</solution>

<testcases>
<caller>
console.log(inPlaceReversal(str));
</caller>
<testcase>
<i>
const str = "erehT era a tsav rebmun fo secruoser rof gninrael erom tpircsavaJ";
</i>
</testcase>
<testcase>
<i>
const str = "tpircsavaJ si emosewa";
</i>
</testcase>
</testcases>
</Editor>