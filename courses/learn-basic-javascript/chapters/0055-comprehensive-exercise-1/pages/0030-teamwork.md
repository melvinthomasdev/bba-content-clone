Ram, Yusuf and Chris are competed as a team for India in olympics relay race. Each had to do 3 laps and pass the baton to their team mate.

- **Ram's average speeds:**
  - First lap: 40 feet per second
  - Second lap: decreased by 1.2
  - Third lap: decreased by 2
- **Yusuf's average speeds:**
  - First lap: 39 feet per second
  - Second lap: decreased by 1
  - Third lap: decreased by 1
- **Chris' average speeds:**
  - First lap: 41 feet per second
  - Second lap: decreased by 1.5
  - Third lap: decreased by 2.5

Update the function to display the average speed of each team member across all laps and the average speed of **Team India**.
Expected output:
`The Average speed of Team India was W feet per second. While the average speed Ram, Yusuf and Chris was X, Y and feet Z per second respectively.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getAverageSpeeds = () => {
  //Write code here
}
</code>
<solution>
const ramFirstLapSpeed = 40;
const yusufFirstLapSpeed = 39;
const chrisFirstLapSpeed = 41;

const ramSecondLapSpeed = ramFirstLapSpeed - 1.2;
const ramThirdLapSpeed = ramSecondLapSpeed - 2;

const yusufSecondLapSpeed = yusufFirstLapSpeed - 1;
const yusufThirdLapSpeed = yusufSecondLapSpeed - 1;

const chrisSecondLapSpeed = chrisFirstLapSpeed - 1.5;
const chrisThirdLapSpeed = chrisSecondLapSpeed - 2.5;

const averageSpeedRam = (ramFirstLapSpeed + ramSecondLapSpeed + ramThirdLapSpeed) / 3;
const averageSpeedYusuf = (yusufFirstLapSpeed + yusufSecondLapSpeed + yusufThirdLapSpeed) / 3;
const averageSpeedChris = (chrisFirstLapSpeed + chrisSecondLapSpeed + chrisThirdLapSpeed) / 3;


const getAverageSpeeds = (
  averageSpeedFirstRunner, averageSpeedSecondRunner,
  averageSpeedThirdRunner
) => {
  const averageSpeedTeamIndia = (averageSpeedFirstRunner + averageSpeedSecondRunner + averageSpeedThirdRunner) / 3;
        console.log(averageSpeedTeamIndia);

  return `The Average speed of Team India was ${averageSpeedTeamIndia} feet per second. While the average speed Ram, Yusuf and Chris was ${averageSpeedFirstRunner}, ${averageSpeedSecondRunner} and feet ${averageSpeedThirdRunner} per second respectively.`;
};
getAverageSpeeds(averageSpeedRam, averageSpeedYusuf, averageSpeedChris);
</solution>
<testcases>
<caller>
getAverageSpeeds(averageSpeedFirstRunner, averageSpeedSecondRunner,averageSpeedThirdRunner)
</caller>
<testcase>
<i>
let averageSpeedFirstRunner = 42
let averageSpeedSecondRunner = 21
let averageSpeedThirdRunner = 43
</i>
</testcase>
<testcase>
<i>
let averageSpeedFirstRunner = 33
let averageSpeedSecondRunner = 38
let averageSpeedThirdRunner = 32
</i>
</testcase>
<testcase>
<i>
let averageSpeedFirstRunner = 43
let averageSpeedSecondRunner = 39
let averageSpeedThirdRunner = 36
</i>
</testcase>
<testcase>
<i>
let averageSpeedFirstRunner = 39
let averageSpeedSecondRunner = 40
let averageSpeedThirdRunner = 40
</i>
</testcase>
<testcase>
<i>
let averageSpeedFirstRunner = 35
let averageSpeedSecondRunner = 41
let averageSpeedThirdRunner = 38
</i>
</testcase>
</testcases>
</codeblock>
