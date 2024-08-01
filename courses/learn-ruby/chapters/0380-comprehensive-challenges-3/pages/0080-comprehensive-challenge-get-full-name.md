Finish the method definition below.

Given an hash `person` with keys `first_name` and `last_name`, the method `full_name` should return a string which combines `first_name` and `last_name` separated by a space.

Note:

1. If the first_name doesn't exist, return just the last_name as the full name
2. If the last_name doesn't exist, return just the first_name as the full name
3. If both first_name and last_name don't exist, return `""` as the full name.

<br/>

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def full_name(person)
  # Write your code here
end
</code>

<solution>
def full_name(person)
  first_name = person[:first_name]
  last_name = person[:last_name]

  "#{first_name} #{last_name}".strip
end
</solution>

<testcases>
<caller>
puts full_name(person)
</caller>
<testcase>
<i>
person = {
  first_name: 'Sherlock',
  last_name: 'Holmes'
}
</i>
</testcase>
<testcase>
<i>
person = {
  first_name: 'Sherlock'
}
</i>
</testcase>
<testcase>
<i>
person = {
  last_name: 'Holmes'
}
</i>
</testcase>
<testcase>
<i>
person = {
  middle_name: 'Scott'
}
</i>
</testcase>
</testcases>
</codeblock>
