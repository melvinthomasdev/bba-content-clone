Finish the method definition given below.

`respondent_details` is an array of hashes. Each hash has keys `:name` and `:age` and  and a few variable number of keys, each a section name. `:name` and `:age` stores the name and age of the respondent, while the other keys store the number of questions the respondent answered against respective section.

Given `respondent_details`, the method should calculate the total number of questions answered by the respondents and store it in a key `:total_count` in each hash. The method should then return the updated array of hashes.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def set_total_count(respondent_details)
  # Write your code here
end
</code>

<solution>
def set_total_count(respondent_details)
  respondent_details.each do |respondent_detail|
    respondent_detail[:total_count] = except_name_and_age(respondent_detail).values.sum
  end
end

def except_name_and_age(respondent_detail)
  respondent_detail.dup.tap do |detail|
    detail.delete(:name)
    detail.delete(:age)
  end
end
</solution>

<testcases>
<caller>
puts set_total_count(respondent_details)
</caller>
<testcase>
<i>
respondent_details = [
  {
    name: "Jacqueline",
    age: 25,
    html: 30,
    css: 11,
    javascript: 23,
    react: 21,
  },
  {
    name: "Dawson",
    age: 32,
    html: 30,
    css: 27,
    javascript: 15,
    ruby: 25,
  },
  {
    name: "Junior",
    age: 39,
    html: 30,
    css: 15,
    javascript: 19,
    ruby: 25,
    sql: 27,
    tailwindCSS: 15
  }
]
</i>
</testcase>
<testcase>
<i>
respondent_details = [
  {
    name: "Mark",
    age: 16,
    html: 30,
    css: 27
  },
  {
    name: "Luke",
    age: 21,
    html: 29,
    css: 24,
    javascript: 17,
  },
  {
    name: "John",
    age: 72,
    html: 30,
    css: 15,
    javascript: 19,
    ruby: 19,
    sql: 25
  }
]
</i>
</testcase>
</testcases>
</Editor>