1. Create an object named myPenguin .
2. Add the following properties:
   - name = Alfred
   - origin = Boner's Ark
   - creator = Mort Walker
   - can-fly = false
   - can-swim = true
3. Print the penguin's name to the console as part of a welcome message, like "Hello, I'm a penguin and my name is [NAME HERE]!"
4. myPenguin["isAquatic"] or myPenguin["origin"], print whichever is truthy value.
5. If your penguin can fly print "I can fly!" to the console. If it can swim, print "I can swim! if neither print "No flying or swimming for me!".

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
const myPenguin = {}

//Adding properties using dot notation.
myPenguin.name = "Alfred";
myPenguin.origin = "Boner's Ark";
myPenguin.creator= "Mort Walker";

//Adding properties using bracket notation.
myPenguin["can-fly"] = false;
myPenguin["can-swim"] = true;

console.log(`Hello, I'm a penguin and my name is ${myPenguin.name}!`);

//nullish coalescing operator
console.log(myPenguin["isAquatic"] ?? myPenguin["origin"]);

//If else statement
if(myPenguin["canFly"]){
	console.log("I can fly!");
} else if (myPenguin["canSwim"]){
	console.log("I can swim!");
} else {
	console.log("No flying or swimming for me!");
}
</solution>
</codeblock>
