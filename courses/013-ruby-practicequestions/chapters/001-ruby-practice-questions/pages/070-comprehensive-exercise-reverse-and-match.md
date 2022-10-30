Finish the method definition given below.

`list` is an array of words. `word` is a single word. Given `list` and `word`, the method should return an entry from `list` if it matches `word` when reversed. It is acceptable even if the match is not case sensitive. If no such match exists, the method should return `false`.


<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def reverse_and_match(word, list)
  # Write your code here
end
</code>

<solution>
def reverse_and_match(word, list)
  list.any?{|match| match.casecmp(word.reverse) == 0 } ? word.reverse : false
end
</solution>

<testcases>
<caller>
puts reverse_and_match(word, list)
</caller>
<testcase>
<i>
list = ["read", "dear", "match", "daer"]
word = "read"
</i>
</testcase>
<testcase>
<i>
list = ["Knits", "Desserts", "Sports", "Star"];
word = "stressed";
</i>
</testcase>
<testcase>
<i>
list = ["Raw", "Smart", "Trams", "Spoons"]
word = "Time"
</i>
</testcase>
</testcases>
</Editor>