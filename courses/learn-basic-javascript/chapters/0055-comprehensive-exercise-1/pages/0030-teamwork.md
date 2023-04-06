Ram, Yusuf and Chris are
competing as a team for India
in olympics relay race. 

Each has to do 1 lap then
pass the baton.

Average speeds of all three
given are `averageSpeedRam`,
`averageSpeedYusuf`, and 
`averageSpeedChris` respectively.

Update the function such that
it logs to the console the
average speed of Team India
as such:
`The Average speed of Team India was X feet per second.`


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
  console.log(`The Average speed of Team India was ${(averageSpeedRam + averageSpeedYusuf + averageSpeedChris)/3} feet per second.`);
};

</solution>
<testcases>
<caller>
getAverageSpeeds(firstAverageSpeed, secondAverageSpeed, thirdAverageSpeed)
</caller>
<testcase>
<i>
let firstAverageSpeed = 42;
let secondAverageSpeed = 21;
let thirdAverageSpeed = 43;
</i>
</testcase>
<testcase>
<i>
let firstAverageSpeed = 33;
let secondAverageSpeed = 38;
let thirdAverageSpeed = 32;
</i>
</testcase>
<testcase>
<i>
let firstAverageSpeed = 43;
let secondAverageSpeed = 39;
let thirdAverageSpeed = 36;
</i>
</testcase>
<testcase>
<i>
let firstAverageSpeed = 39;
let secondAverageSpeed = 40;
let thirdAverageSpeed = 40;
</i>
</testcase>
<testcase>
<i>
let firstAverageSpeed = 35;
let secondAverageSpeed = 41;
let thirdAverageSpeed = 38;
</i>
</testcase>
</testcases>
</codeblock>
