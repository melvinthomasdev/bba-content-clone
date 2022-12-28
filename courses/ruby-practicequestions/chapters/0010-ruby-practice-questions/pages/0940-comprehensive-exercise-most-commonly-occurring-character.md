Finish the method definition given below.

Given a string `str`, the method should return the most commonly occurring character in the string. If there are 2 or more such characters, then the method should return the character which comes first alphabetically.

The function should consider uppercase and lowercase characters as the same, and the output should be in lowercase.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def most_common_character(str)
  # Write your code here
end
</code>

<solution>
def most_common_character(str)
  count_hash = form_count_hash(str)
  most_common, most_common_count = count_hash.max_by{|_,v| v}
  chars_with_same_count = find_chars_with_same_count(
          count_hash.except(most_common),
          most_common_count
  )
  return most_common if chars_with_same_count.empty?

  (chars_with_same_count << most_common).sort.first
end

def form_count_hash(str)
  count_hash = Hash.new(0)
  str.downcase.each_char do |c|
    count_hash[c] += 1
  end
  count_hash
end

def find_chars_with_same_count(count_hash, most_common_count)
  count_hash.select{ |k,v| v == most_common_count }&.keys
end
</solution>

<testcases>
<caller>
puts most_common_character(str)
</caller>
<testcase>
<i>
str = "abcddefg"
</i>
</testcase>
<testcase>
<i>
str = "heggbdeff"
</i>
</testcase>
<testcase>
<i>
str = "KABBAAB"
</i>
</testcase>
<testcase>
<i>
str = "aFsFeeccfFfa"
</i>
</testcase>
<testcase>
<i>
str = "afdsafdsafe"
</i>
</testcase>
<testcase>
<i>
str = "zzzzffffddddsasae"
</i>
</testcase>
</testcases>
</codeblock>