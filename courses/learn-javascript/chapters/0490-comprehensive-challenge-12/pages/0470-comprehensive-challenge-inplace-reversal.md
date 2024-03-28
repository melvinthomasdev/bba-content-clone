Given an input sentence, perform an in-place reversal for all words in the string.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const inPlaceReversal = str => {
  // your code here
};
</code>

<solution>
const inPlaceReversal = str => [...str].reverse().join("").split(" ").reverse().join(" ");
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
<testcase>
<i>
const str = "lmtH si ysae";
</i>
</testcase>
<testcase>
<i>
const str = "ecitcarp sekam a nam tcefrep";
</i>
</testcase>
</testcases>
</codeblock>