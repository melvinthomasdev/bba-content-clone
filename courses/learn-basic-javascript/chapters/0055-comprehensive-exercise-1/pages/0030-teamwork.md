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

Display the average speed of each team member across all laps and the average speed of **Team India**.
Expected output:
`The Average speed of Team India was W feet per second. While the average speed Ram, Yusuf and Chris was X, Y and feet Z per second respectively.`
<codeblock language="javascript" type="lesson">
<code>
</code>
<solution>
const ramFirstLapSpeed = 40
const ramSecondLapSpeed = ramFirstLapSpeed - 1.2
const ramThirdLapSpeed = ramSecondLapSpeed - 2

    const yusufFirstLapSpeed = 39
    const yusufSecondLapSpeed = yusufFirstLapSpeed - 1
    const yusufThirdLapSpeed = yusufSecondLapSpeed - 1

    const chrisFirstLapSpeed = 41
    const chrisSecondLapSpeed = chrisFirstLapSpeed - 1.5
    const chrisThirdLapSpeed = chrisSecondLapSpeed - 2.5

    const averageSpeedRam = (ramFirstLapSpeed + ramSecondLapSpeed + ramThirdLapSpeed) / 3;
    const averageSpeedYusuf = (yusufFirstLapSpeed + yusufSecondLapSpeed + yusufThirdLapSpeed) / 3;
    const averageSpeedChris = (chrisFirstLapSpeed + chrisSecondLapSpeed + chrisThirdLapSpeed) / 3;

    const averageSpeedTeamIndia = (averageSpeedRam + averageSpeedYusuf + averageSpeedChris) / 3

    console.log(
      `The Average speed of Team India was ${averageSpeedTeamIndia} feet per second. While the average speed Ram, Yusuf and Chris was ${averageSpeedRam}, ${averageSpeedYusuf} and feet ${averageSpeedChris} per second respectively.`
      )

  </solution>
</codeblock>
