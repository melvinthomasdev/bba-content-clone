Finish the method definition given below.

A group of people were asked to tell the name a latest Indian movie that they really loved.

`survey_answers` is an array of hashes, each of which has the keys `name` and `favorite_indian_movie`. The method should return an alphabetically sorted unique list of these movie names.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def get_indian_movies(survey_answers)
  # Write your code here
end
</code>

<solution>
def get_indian_movies(survey_answers)
  survey_answers.map{|answer| answer[:favorite_indian_movie]}.uniq.sort
end
</solution>

<testcases>
<caller>
puts get_indian_movies(survey_answers)
</caller>
<testcase>
<i>
survey_answers = [
  {
    name: "Jacqueline",
    favorite_indian_movie: "Kumbalangi Nights",
  },
  {
    name: "Dawson",
    favorite_indian_movie: "Thappad",
  },
  {
    name: "Jocelyn",
    favorite_indian_movie: "Karnan",
  },
  {
    name: "Palmer",
    favorite_indian_movie: "Kumbalangi Nights",
  },
]
</i>
</testcase>
<testcase>
<i>
survey_answers = [
  {
    name: "Arun",
    favorite_indian_movie: "Tumbaad",
  },
  {
    name: "Ali",
    favorite_indian_movie: "Kammatti Paadam",
  },
  {
    name: "Jocelyn",
    favorite_indian_movie: "Asuran",
  },
  {
    name: "Palmer",
    favorite_indian_movie: "Super Deluxe",
  },
]
</i>
</testcase>
<testcase>
<i>
survey_answers = [
  {
    name: "Rohit",
    favorite_indian_movie: "Utharam",
  },
  {
    name: "Ismail",
    favorite_indian_movie: "Ratsasan",
  },
  {
    name: "Peter",
    favorite_indian_movie: "Ratsasan",
  },
  {
    name: "Roy",
    favorite_indian_movie: "Psycho",
  },
]
</i>
</testcase>
</testcases>
</codeblock>