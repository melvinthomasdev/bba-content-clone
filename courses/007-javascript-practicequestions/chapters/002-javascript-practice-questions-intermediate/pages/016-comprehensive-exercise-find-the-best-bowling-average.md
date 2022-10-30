From the list of given json object of cricket players, find the bowler with best bowling average.

1. In cricket, the lower the bowling average is, the better the bowler is performing.
2. Return a value with 3 decimal points.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function findBestBowlingAvg(playerStats) {
  // your code here
}
</code>

<solution>
function findBestBowlingAvg(playerStats) {
  return (Object.keys(playerStats).reduce((currentSum, currentValue) => {
    return Math.min(currentSum, playerStats[currentValue]);
  }, Infinity)).toFixed(3);
}
</solution>

<testcases>
<caller>
console.log(findBestBowlingAvg(playerStats));
</caller>
<testcase>
<i>
const playerStats = {
  "Rose Mary": 14.69,
  "Joey Holden": 16.00,
  "Ged Brewer": 15.77
}
</i>
</testcase>
<testcase>
<i>
const playerStats = {
  "Raymond Curtis": 19.37,
  "Alexander Menzie": 22.00,
  "Josh Harvey": 22.33,
  "Beata Lawrence": 20.28,
  "Doug Morrison": 18.50,
  "Darcy Brewer": 20.80

}
</i>
</testcase>
</testcases>
</Editor>