Finish the method definition given below.

`player_stats` is a hash of stats of cricket players. Each key is the name of the player and the value is their bowling average.

Given `player_stats`, the method should return the bowling average of the player with the best bowling average. In cricket, the lower the bowling average is, the better the bowler is performing.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def find_best_bowling_avg(player_stats)
  # Write your code here
end
</code>

<solution>
def find_best_bowling_avg(player_stats)
  player_stats.min_by{|player, average| average}[1]
end
</solution>

<testcases>
<caller>
puts find_best_bowling_avg(player_stats)
</caller>
<testcase>
<i>
player_stats = {
  "Rose Mary": 14.69,
  "Joey Holden": 16.00,
  "Ged Brewer": 15.77
}
</i>
</testcase>
<testcase>
<i>
player_stats = {
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
</codeblock>