1. Create an object named myPenguin .
2. Add the following properties:
   - name = Alfred
   - origin = Boner's Ark
   - creator = Mort Walker
   - can-fly = false
   - can-swim = true
3. Print the penguin's name to the console as part of a welcome message, like
   "Hello, I'm a penguin and my name is [NAME HERE]!"
4. myPenguin["isAquatic"] or myPenguin["origin"], print whichever is truthy
   value.
5. If your penguin can fly print "I can fly!" to the console. If it can swim,
   print "I can swim! if neither print "No flying or swimming for me!".

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const birdDetails = () => {}
</code>

<solution>
const myBird = {
	"name": "Alfred",
	"origin": "Boner's Ark",
	"creator": "Mort Walker",
	"can-fly": false,
	"can-swim": true,
};

const birdDetails = (bird) => {
console.log(`Hello, I'm a bird and my name is ${bird.name}!`);

    //nullish coalescing operator
    console.log(bird["isAquatic"] ?? bird["origin"]);

    //If else statement
    if (bird["can-fly"]) {
    	console.log("I can fly!");
    } else if (bird["can-swim"]) {
    	console.log("I can swim!");
    } else {
    	console.log("No flying or swimming for me!");
    };

}; birdDetails(myBird);

</solution>
<testcases>
<caller>
birdDetails(newPenguin);
</caller>
<testcase>
<i>
const newPenguin = {
	"name": "Archimedes",
	"origin": "The Once and Future King",
	"creator": "T. H. White",
	"can-fly": true,
	"can-swim": false
}
</i>
</testcase>
<testcase>
<i>
const newPenguin = {
	"name": "Blagden",
	"origin": "The Inheritance Cycle",
	"creator": "Christopher Paolini",
	"can-fly": true,
	"can-swim": false
}
</i>
</testcase>
<testcase>
<i>
const newPenguin = {
  "name": "Big Bird",
  "origin": "Sesame street",
  "creator": "Jim Henson",
  "can-fly": false,
  "can-swim": false
}
</i>
</testcase>
<testcase>
<i>
const newPenguin = {
	"name": "Donald Duck",
	"origin": "The Wise Little Hen",
	"creator": "Dick Lundy",
	"can-fly": false,
	"can-swim": true
}
</i>
</testcase>
</testcases>
</codeblock>
