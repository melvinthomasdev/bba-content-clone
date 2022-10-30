Finish the method definition given below.

Given an array of string `arr`, the method `east_or_west` should replace 'east' with 'west' in all the strings, and return the resulting array. The 'east' keyword will be present in different formats in each string. The formatting should be maintained post replacement. eg. EasT should become WesT.

Go through the test cases to get a better idea.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def east_or_west(arr)
  # Write your code here
end
</code>

<solution>
def east_or_west(arr)
  arr.map! { |x| x.tr("eaEA", "weWE") }
end
</solution>

<testcases>
<caller>
puts east_or_west(arr)
</caller>
<testcase>
<i>
arr = ["east", "EAST", "eastEAST"]
</i>
</testcase>
<testcase>
<i>
arr = ["eAsT EaSt", "EaSt eAsT"]
</i>
</testcase>
<testcase>
<i>
arr = ["east EAST", "e a s t", "E A S T"]
</i>
</testcase>
<testcase>
<i>
arr = ["east EAST", "e a s t", "E A S T", "eAsT"]
</i>
</testcase>
</testcases>
</Editor>