Given will be an array `arrayOfStrings`.

Create a function `getEvenStrings` that
accepts `arrayOfStrings` as a parameter and
creates a new array from it which only has
strings whose length is even and logs it
to the console.


<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here 
</code>
<solution>
const getEvenStrings = arrayOfStrings => {
  let evenStringArray = arrayOfStrings.reduce((accumulator, currentValue) => {
    currentValue.length % 2 == 0 ? accumulator.push(currentValue) : null;
  }, []);
  console.log(evenStringArray);
}
</solution>
<testcases>
<caller>
getEvenStrings(testStringArray);
</caller>
<testcase>
<i>
const testStringArray = ["Ragdoll", "Persian", "Sphynx", "Dalmatian", "German Shepherd", "Pitbull"];
</i>
</testcase>
<testcase>
<i>
const testStringArray = ["Stingray", "Clownfish", "Shark", "Rattlesnake", "Cobra", "Python"];
</i>
</testcase>
<testcase>
<i>
const testStringArray = ["Grizzly Bear", "Black Bear", "Polar Bear", "White Tiger", "Royal Bengal Tiger", "Siberian Tiger"];
};
</i>
</testcase>
</testcases>
</codeblock>
