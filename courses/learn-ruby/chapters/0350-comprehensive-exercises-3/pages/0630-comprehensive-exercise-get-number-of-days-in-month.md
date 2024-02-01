Finish the method definition given below.

Given two numbers `month` and `year`, the method should return the number of days in that `month` in that `year`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
require 'date'

def days_count(month, year)
  # Write your code here
end
</code>

<solution>
require 'date'

def days_count(month, year)
  Date.new(year, month + 1).prev_day.day
end
</solution>

<testcases>
<caller>
puts days_count(month, year)
</caller>
<testcase>
<i>
month = 2
year = 2000
</i>
</testcase>
<testcase>
<i>
month = 2
year = 1977
</i>
</testcase>
<testcase>
<i>
month = 7
year = 2011
</i>
</testcase>
</testcases>
</codeblock>
