From a given list of teams and and the points scored in each round, find the team with the higest total points.

1. Assuming there won't be a tie.
2. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function findWinningTeam(teams) {
  // your code here
}
</code>

<solution>
function findWinningTeam(teams) {
  let winningTeam = {
    name: "",
    totalPoints: 0,
  };
  teams.forEach((team) => {
    const totalPoints = team.points.reduce(
      (currentSum, currentValue) => currentSum + currentValue
    );
    if (winningTeam.totalPoints < totalPoints) {
      winningTeam = {
        name: team.name,
        totalPoints: totalPoints,
      };
    }
  });
  return JSON.stringify(winningTeam);
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
</testcases>
</Editor>