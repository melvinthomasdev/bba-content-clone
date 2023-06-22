A group of people was asked to tell the name of the latest Indian movie that they really loved. From the given list of survey answers, find an alphabetically sorted unique list of these movie names.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getIndianMovies = surveyAnswers => {
  // your code here
}
</code>

<solution>
const getIndianMovies = surveyAnswers => {
  const result = surveyAnswers.map(a => a.favoriteIndianMovie).sort();
  return [...new Set(result)];
}
</solution>

<testcases>
<caller>
console.log(getIndianMovies(surveyAnswers));
</caller>
<testcase>
<i>
let surveyAnswers = [
  {
    name: "Jacqueline",
    favoriteIndianMovie: "Kumbalangi Nights",
  },
  {
    name: "Dawson",
    favoriteIndianMovie: "Thappad",
  },
  {
    name: "Jocelyn",
    favoriteIndianMovie: "Karnan",
  },
  {
    name: "Palmer",
    favoriteIndianMovie: "Kumbalangi Nights",
  },
];
</i>
</testcase>
<testcase>
<i>
let surveyAnswers = [
  {
    name: "Arun",
    favoriteIndianMovie: "Tumbaad",
  },
  {
    name: "Ali",
    favoriteIndianMovie: "Kammatti Paadam",
  },
  {
    name: "Jocelyn",
    favoriteIndianMovie: "Asuran",
  },
  {
    name: "Palmer",
    favoriteIndianMovie: "Super Deluxe",
  },
];
</i>
</testcase>
<testcase>
<i>
let surveyAnswers = [
  {
    name: "Rohit",
    favoriteIndianMovie: "Utharam",
  },
  {
    name: "Ismail",
    favoriteIndianMovie: "Ratsasan",
  },
  {
    name: "Peter",
    favoriteIndianMovie: "Ratsasan",
  },
  {
    name: "Roy",
    favoriteIndianMovie: "Psycho",
  },
];
</i>
</testcase>
</testcases>
</codeblock>