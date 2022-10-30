This is a game of colors.
Red gets 50 points.
Yellow get 40 points.
Any other color gets 30 points.

Write a program so that the hash
returns the right value for
pink color.

<Editor lang="ruby" type="exercise">
<code>
hash = { "red" => 50,
         "yellow" => 40
         }

point_for_pink = hash["pink"]
puts point_for_pink
</code>

<solution>
hash = { "red" => 50,
         "yellow" => 40
         }
hash.default = 30
point_for_pink = hash["pink"]
puts point_for_pink
</solution>
</Editor>