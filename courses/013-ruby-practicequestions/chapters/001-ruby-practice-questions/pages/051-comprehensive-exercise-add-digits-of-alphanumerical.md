Complete the method definition given below.

Given an alphanumeric value `alphanumeric` as input, the method should return with the sum of all its digits. If no digits are present in input, the method should return `false`.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def sum_of_digits(alphanumeric)
  # write your code here
end
</code>

<solution>
def sum_of_digits(alphanumeric)
  if alphanumeric =~ /\d/
    return alphanumeric.to_i.digits.sum
  end

  false
end
</solution>

<testcases>
<caller>
puts sum_of_digits(alphanumeric)
</caller>
<testcase>
<i>
alphanumeric = '0987654321abcdefgh'
</i>
</testcase>
<testcase>
<i>
alphanumeric = '42JohnDoe'
</i>
</testcase>
<testcase>
<i>
alphanumeric = '221BBakerStreet'
</i>
</testcase>
<testcase>
<i>
alphanumeric = 'James'
</i>
</testcase>
</testcases>
</Editor>