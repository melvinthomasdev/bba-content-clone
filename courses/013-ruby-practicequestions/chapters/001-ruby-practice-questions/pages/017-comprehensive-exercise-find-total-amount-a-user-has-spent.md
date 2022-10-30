Finish the method definition below.

Given an array of hashes `expenses`, find the total amount spent by the user.
Each hash in the array `expenses` has two keys "spent_on" and "amount".


<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def total_expence(expenses)
  # write your code here
end
</code>

<solution>
def total_expense(expenses)
  expenses.inject(0) { |sum, expense| sum + expense["amount"] }
end
</solution>

<testcases>
<caller>
puts total_expense(expenses)
</caller>
<testcase>
<i>
expenses = [
  {
    "spent_on"=> "Movie",
    "amount"=> 500,
  },
  {
    "spent_on"=> "Tram",
    "amount"=> 200,
  },
  {
    "spend_on"=> "Lunch",
    "amount"=> 290,
  },
  {
    "spent_on"=> "Groceries",
    "amount"=> 3290,
  },
  {
    "spent_on"=> "Fashion",
    "amount"=> 8290,
  },
]
</i>
</testcase>
<testcase>
<i>
expenses = [
  {
    "spent_on"=> "Train",
    "amount"=> 300,
  },
  {
    "spent_on"=> "Vegetables",
    "amount"=> 800,
  },
  {
    "spent_on"=> "Dairy",
    "amount"=> 300,
  },
  {
    "spent_on"=> "Stationary",
    "amount"=> 1200,
  },
  {
    "spent_on"=> "Fuel",
    "amount"=> 3200,
  },
]
</i>
</testcase>
</testcases>
</Editor>