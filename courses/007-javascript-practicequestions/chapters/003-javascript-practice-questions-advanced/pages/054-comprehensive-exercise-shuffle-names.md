Given a full name, shuffle the same.

1. Complete the functions "shuffleNames" and "shuffle"
2. Do not rename any of the functions given below.
3. Function "shuffleNames" should shuffle Person object's name property.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
class Person {
  constructor(name) {
    this.name = name;
  }
}

function shuffleNames() {
  // your code here
}

function shuffle(str) {
  const person = new Person(str);
  const s = // your code here
  return s()
}
</code>

<solution>
class Person {
  constructor(name) {
    this.name = name;
  }
}

function shuffleNames() {
  return this.name.split(" ").reverse().join(" ");
}

function shuffle(str) {
  const person = new Person(str);
  const s = shuffleNames.bind(person);
  return s();
}
</solution>

<testcases>
<caller>
console.log(shuffle(str));
</caller>
<testcase>
<i>
const str = "Oliver Smith";
</i>
</testcase>
<testcase>
<i>
const str = "Stephan Carlos";
</i>
</testcase>
<testcase>
<i>
const str = "Renu Sen";
</i>
</testcase>
<testcase>
<i>
const str = "Chinua Achebe";
</i>
</testcase>
</testcases>
</Editor>