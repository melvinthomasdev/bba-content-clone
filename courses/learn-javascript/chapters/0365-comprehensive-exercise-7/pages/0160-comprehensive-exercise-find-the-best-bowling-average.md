From the list of cricket players, given in form of the JSON object, find the bowler with the best bowling average.

1. In cricket, the lower the bowling average is, the better the bowler is performing.
2. Return a value with 3 decimal points.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findBestBowlingAvg = playerStats => {
  // your code here
}
</code>

<solution>
const findBestBowlingAvg = playerStats =>
  Object.keys(playerStats)
    .reduce(
      (currentSum, currentValue) =>
        Math.min(currentSum, playerStats[currentValue]),
      Infinity
    )
    .toFixed(3);
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
<testcase>
<i>
const playerStats = {
  "Raymond Curtis": 20.37,
  "Alexander Menzie": 32.00,
  "Josh Harvey": 21.33,
  "Beata Lawrence": 19.28,
  "Doug Morrison": 15.50,
  "Darcy Brewer": 20.80
}
</i>
</testcase>
<testcase>
<i>
const playerStats = {
  "Raymond Curtis": 19.37,
  "Alexander Menzie": 17.00,
  "Josh Harvey": 17.33,
  "Beata Lawrence": 17.28,
  "Doug Morrison": 17.50,
  "Darcy Brewer": 17.80
}
</i>
</testcase>
</testcases>
</codeblock>