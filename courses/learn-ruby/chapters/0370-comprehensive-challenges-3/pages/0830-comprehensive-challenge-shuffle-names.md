Finish the method definition given below.

Given a string `full_name`, the method should shuffle the same, i.e the words in the name should be reversed in order and then resultant name should be returned.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def shuffle_name(full_name)
  # Write your code here
end
</code>

<solution>
def shuffle_name(full_name)
  full_name.split.reverse.join(" ")
end
</solution>

<testcases>
<caller>
puts shuffle_name(full_name)
</caller>
<testcase>
<i>
full_name = 'Oliver Smith'
</i>
</testcase>
<testcase>
<i>
full_name = 'Stephan Carlos'
</i>
</testcase>
<testcase>
<i>
full_name = 'Renu Sen'
</i>
</testcase>
<testcase>
<i>
full_name = 'Chinua Achebe'
</i>
</testcase>
</testcases>
</codeblock>