Look at the following code:

<codeblock language="ruby" type="lesson">
<code>
array = [55, 75, "August 25"]
puts array

home_team_score = array[0]
puts home_team_score

opposite_team_score = array[1]
puts opposite_team_score

date_of_game = array[2]
puts date_of_game
</code>
</codeblock>

Rather than taking four
separate statements to
assign values, the same thing
can be done in one line as shown below:

<codeblock language="ruby" type="lesson">
<code>
array = [55, 75, "August 25"]
home_team_score, opposite_team_score, date_of_game = array

puts home_team_score
puts opposite_team_score
puts date_of_game
</code>
</codeblock>
