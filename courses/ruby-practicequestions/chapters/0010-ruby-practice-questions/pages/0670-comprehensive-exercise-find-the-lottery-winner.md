Finish the method definition given below.

`ticket_lot` is an array of hashes of lottery tickets. Each hash has keys `:id` and `:name`, the id of the ticket and the owner's name.

Given `ticket_lot`, chose the winner whose ticket id is divisible by 113. If there are more than 1, then try 251, 376 and 401 in that order. There will at least be one ticket that matches the winning logic.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def choose_winner(ticket_lot)
  # Write your code here
end
</code>

<solution>
def choose_winner(ticket_lot)
  divisor_frequency = [113, 251, 376, 401]
  divisor_frequency.each do |divisor|
    winner = ticket_lot.select{ |lot| lot[:id] % divisor == 0}
    return winner[0][:id] if winner && winner.length == 1
  end
end
</solution>

<testcases>
<caller>
puts choose_winner(ticket_lot)
</caller>
<testcase>
<i>
ticket_lot = [
  {
    id: 8421,
    name: 'Kendall Gordon',
  },
  {
    id: 1356,
    name: 'Chase Walton',
  },
  {
    id: 2599,
    name: 'Nadia Ali',
  }
]
</i>
</testcase>
<testcase>
<i>
ticket_lot = [
  {
    id: 2825,
    name: "Kendall Gordon"
  },
  {
    id: 2147,
    name: "Chase Walton"
  },
  {
    id: 3765,
    name: "Thomas Bond"
  },
  {
    id: 2761,
    name: "Waldo Lynch"
  },
  {
    id: 3384,
    name: "Margot Stanley"
  },
  {
    id: 4010,
    name: "Maria Dawson"
  },
  {
    id: 4411,
    name: "Daley Ferguson"
  }
]
</i>
</testcase>
</testcases>
</codeblock>