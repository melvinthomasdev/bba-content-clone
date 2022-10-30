Finish the method definition given below.

`teams` is an array of hashes. Each hash has 2 keys, `:name` and `:points`, the name of the team and an array of points scored by them. The team with the highest total points is the winning team.

Given `teams` the method should return a single hash that contains `:name` and `:points` of the winning team, along with a new key `:total_points` that contains the total points of the winning team. Assume that there is only one winning team (no tie).

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def find_winning_team(teams)
  # Write your code here
end
</code>

<solution>
def find_winning_team(teams)
  winning_team = teams.sort_by{|team| team[:points].sum}.last
  winning_team[:total_points] = winning_team[:points].sum
  winning_team
end
</solution>

<testcases>
<caller>
puts find_winning_team(teams)
</caller>
<testcase>
<i>
teams = [
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
teams = [
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