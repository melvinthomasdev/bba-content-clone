From a given list of teams and the points scored in each round, find the team with the highest total points.

1. Assuming there won't be a tie.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findWinningTeam = teams => {
  // your code here
}
</code>

<solution>
const findWinningTeam = teams => {
  let winningTeam = {
    name: "",
    totalPoints: 0,
  };
  winningTeam = teams.reduce((winner,team) => {
    const totalPoints = team.points.reduce(
      (currentSum, currentValue) => currentSum + currentValue
    ,0);
    return winner.totalPoints < totalPoints ? {name: team.name, totalPoints } : winner
  },winningTeam);
  return winningTeam;
}
</solution>

<testcases>
<caller>
console.log(findWinningTeam(teams));
</caller>
<testcase>
<i>
const teams = [
    {
        name: 'Eagles',
        points: [19, 44, 27, 76, 55]
    },
    {
        name: 'Scorpions',
        points: [39, 66, 51, 78, 76]
    },
    {
        name: 'Wolves',
        points: [23, 46, 77, 70, 92]
    }
]
</i>
</testcase>
<testcase>
<i>
const teams = [
    {
        name: 'Tigers',
        points: [76, 46, 28, 39, 20]
    },
    {
        name: 'Lions',
        points: [23, 93, 88, 92, 83]
    },
    {
        name: 'Pumas',
        points: [65, 21, 26, 22, 53]
    }
]
</i>
</testcase>
<testcase>
<i>
const teams = [
    {
        name: 'Elephant',
        points: [20, 30, 40, 50, 60]
    },
    {
        name: 'Ostriches',
        points: [33, 66, 99, 40, 10]
    },
    {
        name: 'Jaguars',
        points: [25, 28, 36, 82, 90]
    }
]
</i>
</testcase>
<testcase>
<i>
const teams = [
    {
      name: 'Rattlesnake',
      points: [30, 33, 36, 40, 48]
    },
    {
      name: 'Hornet',
      points: [51, 57, 99, 82, 88]
    },
    {
      name: 'Mongoose',
      points: [19, 29, 41, 52, 67]
    }
]
</i>
</testcase>
</testcases>
</codeblock>