A group of people were asked to tell the name a latest Indian movie that they really loved. From the given list of the survey answers, find a alphabetically sorted unique list of these movie names.


1. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getIndianMovies(surveyAnswers) {
// your code here
}
</code>

<solution>
function getIndianMovies(surveyAnswers) {
  const result = surveyAnswers.map(a => a.favoriteIndianMovie).sort();
  return JSON.stringify([...new Set(result)]);
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
</Editor>