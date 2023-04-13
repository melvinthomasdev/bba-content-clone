Ram, Yusuf and Chris are competing as a team for India in the Olympics relay race. Each has to do 1 lap then pass the baton.

The average speed of each of them are given in the variables `averageSpeedRam`, `averageSpeedYusuf`, and `averageSpeedChris` respectively.

Update the function such that
it logs to the console the
average speed of Team India in the format: 
`The Average speed of Team India was [Average Speed] feet per second.`


<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getAverageSpeeds = (
  averageSpeedRam,
  averageSpeedYusuf,
  averageSpeedChris
) => {
  //Write code here
}
</code>
<solution>
const getAverageSpeeds = (
  averageSpeedRam,
  averageSpeedYusuf,
  averageSpeedChris
) => {
  const averageSpeed = (averageSpeedRam + averageSpeedYusuf + averageSpeedChris)/3;
  console.log(`The Average speed of Team India was ${averageSpeed} feet per second.`);
};

</solution>
<testcases>
<caller>
getAverageSpeeds(averageSpeedRam, averageSpeedYusuf, averageSpeedChris)
</caller>
<testcase>
<i>
let averageSpeedRam = 42;
let averageSpeedYusuf = 21;
let averageSpeedChris = 43;
</i>
</testcase>
<testcase>
<i>
let averageSpeedRam = 33;
let averageSpeedYusuf = 38;
let averageSpeedChris = 32;
</i>
</testcase>
<testcase>
<i>
let averageSpeedRam = 43;
let averageSpeedYusuf = 39;
let averageSpeedChris = 36;
</i>
</testcase>
<testcase>
<i>
let averageSpeedRam = 39;
let averageSpeedYusuf = 40;
let averageSpeedChris = 40;
</i>
</testcase>
<testcase>
<i>
let averageSpeedRam = 35;
let averageSpeedYusuf = 41;
let averageSpeedChris = 38;
</i>
</testcase>
</testcases>
</codeblock>
