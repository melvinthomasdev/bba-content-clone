A group of people was asked to tell the name of the latest Indian movie that they really loved. From the given list of survey answers, find an alphabetically sorted unique list of these movie names.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getIndianMovies = surveyAnswers => {
  // your code here
}
</code>

<solution>
const getIndianMovies = surveyAnswers => {
  const result = surveyAnswers.map(a => a.favouriteIndianMovie).sort();
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
    favouriteIndianMovie: "Kumbalangi Nights",
  },
  {
    name: "Dawson",
    favouriteIndianMovie: "Thappad",
  },
  {
    name: "Jocelyn",
    favouriteIndianMovie: "Karnan",
  },
  {
    name: "Palmer",
    favouriteIndianMovie: "Kumbalangi Nights",
  },
];
</i>
</testcase>
<testcase>
<i>
let surveyAnswers = [
  {
    name: "Arun",
    favouriteIndianMovie: "Tumbaad",
  },
  {
    name: "Ali",
    favouriteIndianMovie: "Kammatti Paadam",
  },
  {
    name: "Jocelyn",
    favouriteIndianMovie: "Asuran",
  },
  {
    name: "Palmer",
    favouriteIndianMovie: "Super Deluxe",
  },
];
</i>
</testcase>
<testcase>
<i>
let surveyAnswers = [
  {
    name: "Sam",
    favouriteIndianMovie: "Slumdog Millionaire",
  },
  {
    name: "Eve",
    favouriteIndianMovie: "Lunchbox",
  },
  {
    name: "Lao",
    favouriteIndianMovie: "Bahubali",
  },
  {
    name: "Linh",
    favouriteIndianMovie: "Kabali",
  },
];
</i>
</testcase>
<testcase>
<i>
let surveyAnswers = [
  {
    name: "Rohit",
    favouriteIndianMovie: "Utharam",
  },
  {
    name: "Ismail",
    favouriteIndianMovie: "Ratsasan",
  },
  {
    name: "Peter",
    favouriteIndianMovie: "Ratsasan",
  },
  {
    name: "Roy",
    favouriteIndianMovie: "Psycho",
  },
];
</i>
</testcase>
</testcases>
</codeblock>
