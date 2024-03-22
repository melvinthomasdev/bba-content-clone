Finish the method definition given below.

`states` is an array of hashes, each of which has the keys `state`, `capital` and `official_language`. The method should return a new array which is `states` sorted by their capital names in alphabetical order.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sort_capitals(states)
 # Write your code here
end
</code>

<solution>
def sort_capitals(states)
  states.sort_by{|state| state[:capital]}
end
</solution>

<testcases>
<caller>
puts sort_capitals(states)
</caller>
<testcase>
<i>
states = [
      { state: "Manipur", capital: "Imphal", official_Language: 'Meiteilon' },
      { state: "Assam", capital: "Dispur", official_Language: 'Assamese' },
      { state: "Meghalaya	", capital: "Shillong", official_Language: 'English' }
    ]
</i>
</testcase>
<testcase>
<i>
states = [
      { state: "Chhattisgarh", capital: "Naya Raipur", official_Language: 'Chhattisgarhi' },
      { state: "Goa", capital: "Panaji", official_Language: 'Konkani' },
      { state: "Odisha", capital: "Bhubaneswar", official_Language: 'Oriya' }
    ]
</i>
</testcase>
<testcase>
<i>
states = [
      { state: "Karnataka	", capital: "Bengaluru", official_Language: 'Kannada' },
      { state: "Kerala", capital: "Thiruvananthapuram", official_Language: 'Malayalam' },
      { state: "Tamil Nadu", capital: "Chennai", official_Language: 'Assamese' }
    ]
</i>
</testcase>
</testcases>
</codeblock>