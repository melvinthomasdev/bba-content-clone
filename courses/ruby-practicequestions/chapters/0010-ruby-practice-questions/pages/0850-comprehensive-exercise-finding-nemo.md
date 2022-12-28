Finish the method definition given below.

The method should determine the position of the word "Nemo" and return a string in the following manner: `"I found Nemo at [position of the word nemo]!"`. If there are multiple instance of the word, the method should only return position for the first one. If Nemo is not found, the method should return `"I can't find Nemo :("`.

The search for `Nemo` should ignore cases.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def find_nemo(str)
  # Write your code here
end
</code>

<solution>
def find_nemo(str)
  nemo_index = str.downcase.split(' ').find_index('nemo')
  if nemo_index
    return "I found Nemo at #{nemo_index + 1}"
  else
    "I can't find Nemo :("
  end
end
</solution>

<testcases>
<caller>
puts find_nemo(str)
</caller>
<testcase>
<i>
str = 'I nemo am'
</i>
</testcase>
<testcase>
<i>
str = 'I am Dory'
</i>
</testcase>
<testcase>
<i>
str = 'I am finding Nemo !'
</i>
</testcase>
<testcase>
<i>
str = "I am Nemo the real Nemo"
</i>
</testcase>
</testcases>
</codeblock>