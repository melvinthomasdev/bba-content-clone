Finish the method definition given below.

`participants` is an array of names. `condition` is a condition passed as a `proc` to the given method. Given `participants` and `condition`, the method should return an array of names that pass the condition. The proc can be used by calling it as `condition.call(argument)`


<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def remove_unmatched(participants, &condition)
  # Write your code here
end
</code>

<solution>
def remove_unmatched(participants, condition)
  participants.select{|participant| condition.call(participant)}
end
</solution>

<testcases>
<caller>
puts remove_unmatched(participants, condition)
</caller>
<testcase>
<i>
participants = %w[Alban Barlow Walters]
condition = Proc.new do |name|
    name.length < 6
end
</i>
</testcase>
<testcase>
<i>
participants = %w[Gwynyth Ryn Cyndy Rahmath]
condition = Proc.new do |name|
    !(name =~  /[aeiou]/)
end
</i>
</testcase>
<testcase>
<i>
participants = %w[Ben Adam  Lucy  Bane  Benito  Django Benjamen Benjamin]
condition = Proc.new do |name|
    name =~ /^Ben/
end
</i>
</testcase>
</testcases>
</Editor>